Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnoCI-0000ni-O4
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 12:35:56 +0000
Message-ID: <5460B10E.9060501@nod.at>
Date: Mon, 10 Nov 2014 13:35:26 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Juergen Borleis <jbe@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <201411101307.03225.jbe@pengutronix.de>
In-Reply-To: <201411101307.03225.jbe@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: jlauruhn@micron.com, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.11.2014 um 13:07 schrieb Juergen Borleis:
> Hi Richard,
> 
> sorry to jump in so lately:
> 
> Richard Weinberger wrote:
>>> If we ignore read-disturb and don't' scrubb heavily read blocks we will 
>>> have data loss as well. the only difference between the 2 scenarios is
>>> "how long before it happens". Read-disturb wasn't an issue since average
>>> lifespan of a nand device was ~5 years. Read-disturb occurs in a longer
>>> lifespan. that's why it's required now: a need for a "long life nand".
>>
>> Okay, read-disturb will only happen if you read blocks *very* often. Do you
>> have numbers, datasheets, etc...?
> 
> I have made some simple test by reading the first 2048 pages of my NAND in an
> endless loop. Only reading, nothing else (made while the bootloader was run,
> nothing else touches the NAND memory).
> 
> Below a result of my test with a 512 MiB SLC NAND with 2kiB page size and
> 128kiB block size:
> 
> The used NAND controller is able to correct up to 8 flipped bits. After the
> 9th bit is flipped the read returns -74.
> 
> This log is a snapshot after the whole area of the first 4 MiB of the NAND
> were read 201688 times.
> 
>   Page no
>  /    1st bitflip after iteration #
> |    /        2nd bitflip after iteration #
> |    |       /         3rd     4th     5th     6th     7th     8th bitflip after iteration #
> |    |       |        /       /       /       /       /       /          error <errcode> @ iteration #
> |    |       |       |       |       |       |       |       |          /
> |    |       |       |       |       |       |       |       |          |
> [...]
> 529: 91760   -       -       -       -       -       -       -       err: 0 @ 0
> 530: 67168   -       -       -       -       -       -       -       err: 0 @ 0
> 531: 141039  -       -       -       -       -       -       -       err: 0 @ 0
> 532: 100288  -       -       -       -       -       -       -       err: 0 @ 0
> 533: 133754  -       -       -       -       -       -       -       err: 0 @ 0
> 534: 130095  -       -       -       -       -       -       -       err: 0 @ 0
> 535: -       -       -       -       -       -       -       -       err: 0 @ 0
> 536: -       -       -       -       -       -       -       -       err: 0 @ 0
> 537: -       -       -       -       -       -       -       -       err: 0 @ 0
> 538: 116134  -       -       -       -       -       -       -       err: 0 @ 0
> 539: 198269  -       -       -       -       -       -       -       err: 0 @ 0
> 540: 61589   -       -       -       -       -       -       -       err: 0 @ 0
> 541: 69437   126618  -       -       -       -       -       -       err: 0 @ 0
> 542: 127839  146936  -       -       -       -       -       -       err: 0 @ 0
> 543: 90092   112675  -       -       -       -       -       -       err: 0 @ 0
> 544: 110714  -       -       -       -       -       -       -       err: 0 @ 0
> 545: 102323  179716  -       -       -       -       -       -       err: 0 @ 0
> 546: 63838   107524  -       -       -       -       -       -       err: 0 @ 0
> 547: 140739  -       -       -       -       -       -       -       err: 0 @ 0
> 548: 129423  -       -       -       -       -       -       -       err: 0 @ 0
> 549: 79855   172562  189242  -       -       -       -       -       err: 0 @ 0
> 550: 59809   95758   -       -       -       -       -       -       err: 0 @ 0
> 551: 61590   102645  182467  199394  -       -       -       -       err: 0 @ 0
> 552: 34892   47024   169765  -       -       -       -       -       err: 0 @ 0
> 553: 26725   99616   168528  -       -       -       -       -       err: 0 @ 0
> 554: 23348   117529  160522  194367  -       -       -       -       err: 0 @ 0
> 555: 108062  175917  -       -       -       -       -       -       err: 0 @ 0
> 556: 49259   120590  188435  -       -       -       -       -       err: 0 @ 0
> 557: 54306   96666   120881  -       -       -       -       -       err: 0 @ 0
> 558: 29085   31802   42191   43422   108748  167569  -       -       err: 0 @ 0
> 559: 56507   93286   -       -       -       -       -       -       err: 0 @ 0
> 560: 81849   101134  143402  152513  -       -       -       -       err: 0 @ 0
> 561: 13890   135991  199507  -       -       -       -       -       err: 0 @ 0
> 562: 34135   69826   90917   107625  147321  161796  194928  199981  err: 0 @ 0
> 563: 36564   83188   89780   110756  113977  132219  171701  181298  err: -74 @ 196719
> 564: 24710   84965   131464  136672  143401  166123  196109  -       err: 0 @ 0
> 565: 63052   190669  200874  -       -       -       -       -       err: 0 @ 0
> 566: 23602   62334   107324  108235  111701  141831  143176  170709  err: 0 @ 0
> 567: 7827    81759   105200  146536  175196  181900  192630  200021  err: 0 @ 0
> 568: 19248   38095   42491   85788   108021  150404  178145  -       err: 0 @ 0
> 569: 77853   93441   116798  149955  175747  -       -       -       err: 0 @ 0
> 570: 23229   34546   60418   84112   169202  191880  198953  -       err: 0 @ 0
> 571: 53596   66769   106074  133504  134134  163610  169159  178226  err: -74 @ 180360
> 572: 74009   83572   89710   103833  116947  147067  167137  -       err: 0 @ 0
> 573: 23161   43896   89573   95705   102324  102887  115829  122581  err: -74 @ 138582
> [...]
> 
> You can see some pages start to suffer from read disturbance after about
> 7,000 reads and fail after 200,000 reads, other pages start at 23,000 reads
> but fails at 120,000 reads. There is no rule when a page starts to suffer
> from read disturbance and how fast. So a simple read counter with a threshhold
> to detect when to recover a page/block seems not helpful to me.
> 
> I'm still trying to interpret the test results. At least there are areas in
> the 4 MiB areas which show massive bit flips, while other areas have still no
> flipped bits.
> 
> For example the log shown above continues with this pattern:
> 
> 574: -       -       -       -       -       -       -       -       err: 0 @ 0
> 575: -       -       -       -       -       -       -       -       err: 0 @ 0
> 576: -       -       -       -       -       -       -       -       err: 0 @ 0
> 577: -       -       -       -       -       -       -       -       err: 0 @ 0
> 578: -       -       -       -       -       -       -       -       err: 0 @ 0
> 579: -       -       -       -       -       -       -       -       err: 0 @ 0
> 580: -       -       -       -       -       -       -       -       err: 0 @ 0
> 581: -       -       -       -       -       -       -       -       err: 0 @ 0
> 582: -       -       -       -       -       -       -       -       err: 0 @ 0
> 583: -       -       -       -       -       -       -       -       err: 0 @ 0
> 584: -       -       -       -       -       -       -       -       err: 0 @ 0
> 585: -       -       -       -       -       -       -       -       err: 0 @ 0
> 586: -       -       -       -       -       -       -       -       err: 0 @ 0
> 587: -       -       -       -       -       -       -       -       err: 0 @ 0
> 588: -       -       -       -       -       -       -       -       err: 0 @ 0
> 589: -       -       -       -       -       -       -       -       err: 0 @ 0
> 590: -       -       -       -       -       -       -       -       err: 0 @ 0
> 591: -       -       -       -       -       -       -       -       err: 0 @ 0
> 592: 194921  -       -       -       -       -       -       -       err: 0 @ 0
> 593: -       -       -       -       -       -       -       -       err: 0 @ 0
> 594: -       -       -       -       -       -       -       -       err: 0 @ 0
> 595: 99328   186011  -       -       -       -       -       -       err: 0 @ 0
> 596: 178049  188598  -       -       -       -       -       -       err: 0 @ 0
> 597: -       -       -       -       -       -       -       -       err: 0 @ 0
> 598: 88247   -       -       -       -       -       -       -       err: 0 @ 0
> 599: 66701   -       -       -       -       -       -       -       err: 0 @ 0
> 600: 68454   -       -       -       -       -       -       -       err: 0 @ 0
> 601: 152351  -       -       -       -       -       -       -       err: 0 @ 0
> 602: 33574   56123   -       -       -       -       -       -       err: 0 @ 0
> 603: 130160  -       -       -       -       -       -       -       err: 0 @ 0
> 604: 87415   -       -       -       -       -       -       -       err: 0 @ 0
> 605: 121079  140456  -       -       -       -       -       -       err: 0 @ 0
> 606: 78960   201089  -       -       -       -       -       -       err: 0 @ 0
> 607: 67561   -       -       -       -       -       -       -       err: 0 @ 0
> 608: 136825  -       -       -       -       -       -       -       err: 0 @ 0
> 609: 46315   -       -       -       -       -       -       -       err: 0 @ 0
> 610: 38588   86638   100277  149299  193350  -       -       -       err: 0 @ 0
> 611: 77835   106222  184955  -       -       -       -       -       err: 0 @ 0
> 612: 82427   196739  -       -       -       -       -       -       err: 0 @ 0
> 613: 45261   69448   -       -       -       -       -       -       err: 0 @ 0
> 614: 49466   177882  -       -       -       -       -       -       err: 0 @ 0
> 615: 68595   130868  -       -       -       -       -       -       err: 0 @ 0
> 616: 40169   134280  151830  -       -       -       -       -       err: 0 @ 0
> 617: 47167   130047  -       -       -       -       -       -       err: 0 @ 0
> 618: 62839   114948  125289  -       -       -       -       -       err: 0 @ 0
> 619: 45988   -       -       -       -       -       -       -       err: 0 @ 0
> 620: 22611   70944   125715  183733  185630  193842  -       -       err: 0 @ 0
> 621: 71908   171400  -       -       -       -       -       -       err: 0 @ 0
> 622: 21252   44002   114774  154423  190673  -       -       -       err: 0 @ 0
> 623: 33323   35582   101091  117813  -       -       -       -       err: 0 @ 0
> 624: 68726   108034  113045  -       -       -       -       -       err: 0 @ 0
> 625: 45920   63497   122692  159199  165520  169147  200725  -       err: 0 @ 0
> 626: 39039   60375   92903   101632  102331  118883  -       -       err: 0 @ 0
> 627: 44046   102881  163181  -       -       -       -       -       err: 0 @ 0
> 628: 53511   89063   158921  194571  -       -       -       -       err: 0 @ 0
> 629: 45185   78174   118801  160227  192668  -       -       -       err: 0 @ 0
> 630: 106109  117537  165575  170772  183222  -       -       -       err: 0 @ 0
> 631: 8848    15614   120298  -       -       -       -       -       err: 0 @ 0
> 632: 58004   -       -       -       -       -       -       -       err: 0 @ 0
> 633: 102767  155246  200323  -       -       -       -       -       err: 0 @ 0
> 634: 44970   45381   78299   103220  108726  174601  -       -       err: 0 @ 0
> 635: 24964   46413   58086   71776   195353  -       -       -       err: 0 @ 0
> 636: 16024   64719   77322   83557   120118  134934  137786  157911  err: -74 @ 173650
> 637: 54520   76187   89813   97778   125270  150291  178132  185518  err: -74 @ 199306
> 638: -       -       -       -       -       -       -       -       err: 0 @ 0
> 639: -       -       -       -       -       -       -       -       err: 0 @ 0
> 640: -       -       -       -       -       -       -       -       err: 0 @ 0
> 641: -       -       -       -       -       -       -       -       err: 0 @ 0
> 642: -       -       -       -       -       -       -       -       err: 0 @ 0
> 643: -       -       -       -       -       -       -       -       err: 0 @ 0
> 644: -       -       -       -       -       -       -       -       err: 0 @ 0
> 645: -       -       -       -       -       -       -       -       err: 0 @ 0
> 646: -       -       -       -       -       -       -       -       err: 0 @ 0
> 647: -       -       -       -       -       -       -       -       err: 0 @ 0
> 648: -       -       -       -       -       -       -       -       err: 0 @ 0
> [...]
> 
> More confusing: the same test running on a 256 MiB NAND shows a different
> result with much less failures. After about 200,000 loops *all* pages are
> still okay (or correctable). The max bit flips in one page were four.
> 
> [...]
> 546: -       -       -       -       -       -       -       -       err: 0 @ 0
> 547: -       -       -       -       -       -       -       -       err: 0 @ 0
> 548: -       -       -       -       -       -       -       -       err: 0 @ 0
> 549: -       -       -       -       -       -       -       -       err: 0 @ 0
> 550: -       -       -       -       -       -       -       -       err: 0 @ 0
> 551: -       -       -       -       -       -       -       -       err: 0 @ 0
> 552: -       -       -       -       -       -       -       -       err: 0 @ 0
> 553: -       -       -       -       -       -       -       -       err: 0 @ 0
> 554: 198362  -       -       -       -       -       -       -       err: 0 @ 0
> 555: 138881  -       -       -       -       -       -       -       err: 0 @ 0
> 556: -       -       -       -       -       -       -       -       err: 0 @ 0
> 557: -       -       -       -       -       -       -       -       err: 0 @ 0
> 558: -       -       -       -       -       -       -       -       err: 0 @ 0
> 559: 77431   -       -       -       -       -       -       -       err: 0 @ 0
> 560: 100023  -       -       -       -       -       -       -       err: 0 @ 0
> 561: -       -       -       -       -       -       -       -       err: 0 @ 0
> 562: 83265   -       -       -       -       -       -       -       err: 0 @ 0
> 563: 154552  -       -       -       -       -       -       -       err: 0 @ 0
> 564: 154541  -       -       -       -       -       -       -       err: 0 @ 0
> 565: -       -       -       -       -       -       -       -       err: 0 @ 0
> 566: -       -       -       -       -       -       -       -       err: 0 @ 0
> 567: -       -       -       -       -       -       -       -       err: 0 @ 0
> 568: 105275  -       -       -       -       -       -       -       err: 0 @ 0
> 569: 91386   186096  -       -       -       -       -       -       err: 0 @ 0
> 570: -       -       -       -       -       -       -       -       err: 0 @ 0
> 571: 43163   -       -       -       -       -       -       -       err: 0 @ 0
> 572: 79839   190846  -       -       -       -       -       -       err: 0 @ 0
> 573: 184267  -       -       -       -       -       -       -       err: 0 @ 0
> 574: -       -       -       -       -       -       -       -       err: 0 @ 0
> 575: -       -       -       -       -       -       -       -       err: 0 @ 0
> 576: -       -       -       -       -       -       -       -       err: 0 @ 0
> 577: -       -       -       -       -       -       -       -       err: 0 @ 0
> 578: -       -       -       -       -       -       -       -       err: 0 @ 0
> 579: -       -       -       -       -       -       -       -       err: 0 @ 0
> [...]
> 1848: -       -       -       -       -       -       -       -       err: 0 @ 0
> 1849: 115731  168972  178123  196740  -       -       -       -       err: 0 @ 0
> 1850: -       -       -       -       -       -       -       -       err: 0 @ 0
> [...]

Thanks a lot for this report, your number are a very valuable input.
They prove what Artem and I feared, it is almost impossible to define a sane threshold.
So, having exact read-counters will be almost useless.
All we can do is scrubbing PEBs unconditionally.

Can you share your test program? I'd like to run it also on one of my boards.

Thanks,
//richard
