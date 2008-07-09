Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGW34-0004lD-77
	for linux-mtd@lists.infradead.org; Wed, 09 Jul 2008 09:33:19 +0000
Message-ID: <415595625.08154@cqu.edu.cn>
Subject: Re: [UBI][WL][PATCH] Rewrite the UBI wear-leveling unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1215583583.14618.65.camel@sauron>
References: <1215519259.2706.19.camel@localhost.localdomain>
	<1215520533.14618.24.camel@sauron>
	<1215526704.2706.85.camel@localhost.localdomain>
	<1215583583.14618.65.camel@sauron>
Content-Type: text/plain
Date: Wed, 09 Jul 2008 17:32:22 +0800
Message-Id: <1215595942.4272.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 2008-07-09 at 09:06 +0300, Artem Bityutskiy wrote:
> Hi,
> 
> actually, lets CC MTD mailing list next time. I think the discussion
> really should be public, do you have objections?
> 
> On Tue, 2008-07-08 at 22:18 +0800, xiaochuan-xu wrote:
> > > 1. Describe the problems of current algorithm.
> > 
> > I had a wear-leveling experiment before my patch. there are two wear
> > leveling reports of current algorithm :
> > 
> > [nandsim] ****** Wear Report ******
> > [nandsim] Total numbers of erases:  14440020
> > [nandsim] Number of erase blocks:   4096
> > [nandsim] Average number of erases: 3525
> > [nandsim] Maximum number of erases: 4121
> > [nandsim] Minimum number of erases: 25
> > [nandsim] Number of ebs with erase counts:
> > [nandsim] from 25 to 435 : 534
> > [nandsim] from 436 to 844 : 1
> > [nandsim] from 845 to 1254 : 0
> > [nandsim] from 1255 to 1663 : 0
> > [nandsim] from 1664 to 2073 : 1
> > [nandsim] from 2074 to 2483 : 61
> > [nandsim] from 2484 to 2892 : 9
> > [nandsim] from 2893 to 3302 : 5
> > [nandsim] from 3303 to 3711 : 6
> > [nandsim] from 3712 to 4121 : 3479
> > [nandsim] *** End of Wear Report ***
> > 
> > [nandsim] Total numbers of erases:  7600000
> > [nandsim] Number of erase blocks:   4096
> > [nandsim] Average number of erases: 1855
> > [nandsim] Maximum number of erases: 2970
> > [nandsim] Minimum number of erases: 1
> > [nandsim] Number of ebs with erase counts:
> > [nandsim] from 1 to 60 : 1537
> > [nandsim] from 61 to 120 : 0
> > [nandsim] from 121 to 179 : 0
> >                                    .......
> >                                       0
> >                		            .......
> > [nandsim] from 2733 to 2792 : 0
> > [nandsim] from 2793 to 2851 : 0
> > [nandsim] from 2852 to 2911 : 1
> > [nandsim] from 2912 to 2970 : 2558
> > [nandsim] *** End of Wear Report ***
> 
> Which kind of workload did you use in your experiment? I mean, what did
> you do with the UBI volumes?
> 

My experiment is based on nandsim, UBI, UBIFS, on my PC. Then
reading/writing the UBIFS over.

> > 1. two or three stripes can visually be identified. 
> >     @ Upper stripe: overly involved in the wear leveling
> >     @ Middle one: 
> >     @ and Bottom one. young blocks were not timely involved in wear
> > leveling.  
> > why not use the Botton PEBs  instead of the UPPER ones?
> 
> So basically you say that currently UBI keeps using the same PEBs over
> and over again, until their EC exceeds the threshold. And only after
> this, UBI starts using other PEBs, with low erase-counter. And you say
> that it is better to always involve all PEBs into use, instead of just a
> subset of them. Right? I agree if yes.
> 
Yes. all PEBs always involve in the wear leveling propose. 

> > 2. in the current algorithm erase counter is the only key word for
> > wear leveling, which is sometimes difficult to choose an 'optimal'
> > physical eraseblock as the 'scapegoat'.
> 
> Agreed.
> 
> > 3. as you said "looks too complex, should be simplified (later).
> > the PROT TREE, specially, is complex and inexplicable. 
> 
> Agreed. The protection tree is an ugly hack to fix issues which arise
> because of the design limitation you pointed above (issue number 2). It
> would be nice to get rid of it.
> 
> > > 2. Describe your new algorithm and how it solve the problems of the
> > > current one.
> 
> > So, I use two-dimension(PEB ec, LEB temp) key in the wear leveling
> > algorithm in order to improve the rationality for the 'scapegoat'
> > selecting, with is not only pay close attention to the youngest PEB the
> > more frequent selected, but also try one's best to put 'Old' LEB into
> > 'Old' PEB directly (which is avoid some unnecessary wear-leveling in the
> > future). 
> > 
> > the KEY algorithm is in the 'ubi_wl_get_peb()' function and @ubi->used 
> > RB-tree.The former is get a 'optimal' physical eraseblock (PEB) and
> > insert it int to @ubi->used RB-tree. Look at the function for the
> > details. And the later uses (PEB erase counter, LEB 'temperature') pair
> > as it's key wods inthe RB-tree. NOTICE, erase counter first, temperature
> > second, which make the younger PEB the earlier to be wear-leveled. and
> > the second key @e->temp ensures that the younger LEB the earlier to be
> > wear-leveled.So, younger PEB stores younger LEB, older LEB resides in
> > older PEB.
> > 
> > There are only two RB-tree (free and used) and a workqueue. Although
> > scrub RB-tree is still in my implement, but it's unnecessary to nedd a
> > RB-tree. just a container.
> 
> I think I vaguely understand what you mean, but not cleanly. I need the
> code to look at. You sent just a patch, which is difficult to read. And
> I cannot apply the patch, because it is line-wrapped.
> 
I'm sorry. I'll send you a new patch with made by diff command soon. 

In my algorithm, 

1. The FREE PEBs is sorted int the FREE tree by means of EC only . when
the UBI client call for a free PEB, a optional PEB is selected based on
the data type:

shortterm ---> youngest PEB.
unkown	   ---> 1/4 old PEB.
longterm  --->  middle age PEB. 
and age above the middle PEB are protected .

and then just before insert the selected PEB into USED RB-tree. a
'temperature' value is set in the @e->temp. such "temperature" is just a
sequent number which can be used to check every two LEBs' age, i.e.,
small temperature LEB is younger than the other. 

2. so, after inserto the selected PEB into the USED tree. all the PEB
are also ordered. As I mentioned last email. the USED tree's order bases
on PEB EC (first) and LEB 'temperature' (SECOND). So,as the whole, the
USED tree is sorted by EC. BUT, in the section of same EC PEBs, they are
sorted by 'TEMP'. 

3.  when the wear-leveling worker is called. I choosed the smallest PEB
in the USED RB-tree to compare with the middle one in the FREE RB-tree -
UBI_WL_EC_DELTA. is the former is smaller, DO wear-leveling: move the
data from such used PEB to the free on with ec equal to
@MIDDLE_FREE_PEB's EC + UBI_WL_EC_DELTA. why do selected such peb as the
scapegoat'??  because the smallest used PEB stores the OLDEST data(LEB)
----- temp of the PEB wl_entry is the smallest one. So, after the data
moving, older data (changes unfrequently) stores in the older peb.

4. suppose that, the youngest free PEB just insert into the used tree
and becomes the smallest one in the used tree. wear-leveling or not???
NO, I compare the current global temperature with the  'scapegoat', if
it is bigger than the (current global termperature - UBI_WL_TEMP_DELTA).
no wear-leveling should do, Because we don't kown the data in such
'scapegoat' is frequent change or not. if frequent it is, wl unit just
do a idle work ! 


> Which e-mail client do you use? 

my e-mail client is the 'evolution'( FC8's e-mail client).

> This lkml thread has discussion about
> some Linux e-mail clients and how to make them send patches correctly:
> 
> http://lkml.org/lkml/2005/12/26/12
> 
> You may always send the patch to yourself and try to apply it and check
> if everything is fine or not.
> 
> Well, anyway, you may send be the code as attachment. However, when you
> send to public mailing lists, you should properly inline code/patches.
> 
> > my experiment with CONFIG_MTD_UBI_WL_THRESHOLD = 20.
> > Jul  8 11:35:17 xxc kernel: [nandsim] ****** Wear Report ******
> > Jul  8 11:35:17 xxc kernel: [nandsim] Total numbers of erases:  920000
> > Jul  8 11:35:17 xxc kernel: [nandsim] Number of erase blocks:   4096
> > Jul  8 11:35:17 xxc kernel: [nandsim] Average number of erases: 224
> > Jul  8 11:35:17 xxc kernel: [nandsim] Maximum number of erases: 226
> > Jul  8 11:35:17 xxc kernel: [nandsim] Minimum number of erases: 209
> > Jul  8 11:35:17 xxc kernel: [nandsim] Number of ebs with erase counts:
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 209 to 209 : 2
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 210 to 210 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 211 to 211 : 1
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 212 to 212 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 213 to 213 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 214 to 214 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 215 to 215 : 1
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 216 to 216 : 72
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 217 to 217 : 322
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 218 to 218 : 43
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 219 to 219 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 220 to 220 : 3
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 221 to 221 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 222 to 222 : 1
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 223 to 223 : 2
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 224 to 224 : 0
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 225 to 225 : 1646
> > Jul  8 11:35:17 xxc kernel: [nandsim] from 226 to 226 : 2003
> > Jul  8 11:35:17 xxc kernel: [nandsim] *** End of Wear Report ***
> 
> I see that erase-counter is distributed better with your algorithm which
> is good. But I do not know what to compare this with. I mean, it would
> be nice to see _the same_ test running with old UBI and UBI patched with
> your changing. You gave 3 nandsim outputs of the old algorithm, and 1 of
> the new algorithm. Which ones do I compare to see how the total number
> of erases changes?
> 

I'll sent you my patch. sent to the MTD email-list or you personal
email?? 
>do you have objections?
I'm willing to discussion public!
you can help me to experiment it and compare with the current algorithm.
thanks. 

with some more reports with my algorithm:
Jul  9 10:01:15 xxc kernel: [nandsim] ****** Wear Report ******
Jul  9 10:01:15 xxc kernel: [nandsim] Total numbers of erases:  1635000
Jul  9 10:01:15 xxc kernel: [nandsim] Number of erase blocks:   4096
Jul  9 10:01:15 xxc kernel: [nandsim] Average number of erases: 399
Jul  9 10:01:15 xxc kernel: [nandsim] Maximum number of erases: 403
Jul  9 10:01:15 xxc kernel: [nandsim] Minimum number of erases: 383
Jul  9 10:01:15 xxc kernel: [nandsim] Number of ebs with erase counts:
Jul  9 10:01:15 xxc kernel: [nandsim] from 383 to 383 : 102
Jul  9 10:01:15 xxc kernel: [nandsim] from 384 to 384 : 148
Jul  9 10:01:15 xxc kernel: [nandsim] from 385 to 385 : 118
Jul  9 10:01:15 xxc kernel: [nandsim] from 386 to 386 : 39
Jul  9 10:01:15 xxc kernel: [nandsim] from 387 to 387 : 64
Jul  9 10:01:15 xxc kernel: [nandsim] from 388 to 388 : 20
Jul  9 10:01:15 xxc kernel: [nandsim] from 389 to 389 : 16
Jul  9 10:01:15 xxc kernel: [nandsim] from 390 to 390 : 3
Jul  9 10:01:15 xxc kernel: [nandsim] from 391 to 391 : 98
Jul  9 10:01:15 xxc kernel: [nandsim] from 392 to 392 : 44
Jul  9 10:01:15 xxc kernel: [nandsim] from 393 to 393 : 44
Jul  9 10:01:15 xxc kernel: [nandsim] from 394 to 394 : 44
Jul  9 10:01:15 xxc kernel: [nandsim] from 395 to 395 : 25
Jul  9 10:01:15 xxc kernel: [nandsim] from 396 to 396 : 45
Jul  9 10:01:15 xxc kernel: [nandsim] from 397 to 397 : 39
Jul  9 10:01:15 xxc kernel: [nandsim] from 398 to 398 : 42
Jul  9 10:01:15 xxc kernel: [nandsim] from 399 to 399 : 28
Jul  9 10:01:15 xxc kernel: [nandsim] from 400 to 400 : 357
Jul  9 10:01:15 xxc kernel: [nandsim] from 401 to 401 : 267
Jul  9 10:01:15 xxc kernel: [nandsim] from 402 to 402 : 1290
Jul  9 10:01:15 xxc kernel: [nandsim] from 403 to 403 : 1263
Jul  9 10:01:15 xxc kernel: [nandsim] *** End of Wear Report ***


Jul  9 10:52:44 xxc kernel: [nandsim] ****** Wear Report ******
Jul  9 10:52:44 xxc kernel: [nandsim] Total numbers of erases:  2795000
Jul  9 10:52:44 xxc kernel: [nandsim] Number of erase blocks:   4096
Jul  9 10:52:44 xxc kernel: [nandsim] Average number of erases: 682
Jul  9 10:52:44 xxc kernel: [nandsim] Maximum number of erases: 686
Jul  9 10:52:44 xxc kernel: [nandsim] Minimum number of erases: 666
Jul  9 10:52:44 xxc kernel: [nandsim] Number of ebs with erase counts:
Jul  9 10:52:44 xxc kernel: [nandsim] from 666 to 666 : 39
Jul  9 10:52:44 xxc kernel: [nandsim] from 667 to 667 : 63
Jul  9 10:52:44 xxc kernel: [nandsim] from 668 to 668 : 20
Jul  9 10:52:44 xxc kernel: [nandsim] from 669 to 669 : 17
Jul  9 10:52:44 xxc kernel: [nandsim] from 670 to 670 : 3
Jul  9 10:52:44 xxc kernel: [nandsim] from 671 to 671 : 41
Jul  9 10:52:44 xxc kernel: [nandsim] from 672 to 672 : 43
Jul  9 10:52:44 xxc kernel: [nandsim] from 673 to 673 : 138
Jul  9 10:52:44 xxc kernel: [nandsim] from 674 to 674 : 68
Jul  9 10:52:44 xxc kernel: [nandsim] from 675 to 675 : 25
Jul  9 10:52:44 xxc kernel: [nandsim] from 676 to 676 : 45
Jul  9 10:52:44 xxc kernel: [nandsim] from 677 to 677 : 39
Jul  9 10:52:44 xxc kernel: [nandsim] from 678 to 678 : 42
Jul  9 10:52:44 xxc kernel: [nandsim] from 679 to 679 : 28
Jul  9 10:52:44 xxc kernel: [nandsim] from 680 to 680 : 357
Jul  9 10:52:44 xxc kernel: [nandsim] from 681 to 681 : 265
Jul  9 10:52:44 xxc kernel: [nandsim] from 682 to 682 : 58
Jul  9 10:52:44 xxc kernel: [nandsim] from 683 to 683 : 103
Jul  9 10:52:44 xxc kernel: [nandsim] from 684 to 684 : 152
Jul  9 10:52:44 xxc kernel: [nandsim] from 685 to 685 : 2435
Jul  9 10:52:44 xxc kernel: [nandsim] from 686 to 686 : 115
Jul  9 10:52:44 xxc kernel: [nandsim] *** End of Wear Report ***





Jul  9 10:55:10 xxc kernel: [nandsim] ****** Wear Report ******
Jul  9 10:55:10 xxc kernel: [nandsim] Total numbers of erases:  2835000
Jul  9 10:55:10 xxc kernel: [nandsim] Number of erase blocks:   4096
Jul  9 10:55:10 xxc kernel: [nandsim] Average number of erases: 692
Jul  9 10:55:10 xxc kernel: [nandsim] Maximum number of erases: 698
Jul  9 10:55:10 xxc kernel: [nandsim] Minimum number of erases: 678
Jul  9 10:55:10 xxc kernel: [nandsim] Number of ebs with erase counts:
Jul  9 10:55:10 xxc kernel: [nandsim] from 678 to 678 : 42
Jul  9 10:55:10 xxc kernel: [nandsim] from 679 to 679 : 28
Jul  9 10:55:10 xxc kernel: [nandsim] from 680 to 680 : 357
Jul  9 10:55:10 xxc kernel: [nandsim] from 681 to 681 : 265
Jul  9 10:55:10 xxc kernel: [nandsim] from 682 to 682 : 58
Jul  9 10:55:10 xxc kernel: [nandsim] from 683 to 683 : 102
Jul  9 10:55:10 xxc kernel: [nandsim] from 684 to 684 : 187
Jul  9 10:55:10 xxc kernel: [nandsim] from 685 to 685 : 119
Jul  9 10:55:10 xxc kernel: [nandsim] from 686 to 686 : 39
Jul  9 10:55:10 xxc kernel: [nandsim] from 687 to 687 : 63
Jul  9 10:55:10 xxc kernel: [nandsim] from 688 to 688 : 20
Jul  9 10:55:10 xxc kernel: [nandsim] from 689 to 689 : 16
Jul  9 10:55:10 xxc kernel: [nandsim] from 690 to 690 : 3
Jul  9 10:55:10 xxc kernel: [nandsim] from 691 to 691 : 71
Jul  9 10:55:10 xxc kernel: [nandsim] from 692 to 692 : 58
Jul  9 10:55:10 xxc kernel: [nandsim] from 693 to 693 : 44
Jul  9 10:55:10 xxc kernel: [nandsim] from 694 to 694 : 44
Jul  9 10:55:10 xxc kernel: [nandsim] from 695 to 695 : 25
Jul  9 10:55:10 xxc kernel: [nandsim] from 696 to 696 : 49
Jul  9 10:55:10 xxc kernel: [nandsim] from 697 to 697 : 2139
Jul  9 10:55:10 xxc kernel: [nandsim] from 698 to 698 : 367
Jul  9 10:55:10 xxc kernel: [nandsim] *** End of Wear Report ***

> Thanks!
> 
