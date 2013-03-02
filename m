Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBnyx-0005ev-1O
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2013 15:04:16 +0000
Message-ID: <1362236681.2745.19.camel@sauron>
Subject: Re: [UBIFS][CRC Mismatch]
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
Date: Sat, 02 Mar 2013 17:04:41 +0200
In-Reply-To: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
References: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-02-19 at 10:44 -0800, Colin Foe-Parker wrote:
> Hi All,
> 
> I am seeing an issue that I would love some outside help on.
> 
> I am running UBIFS on TI's latest Linux 3.2.0 PSP (5.06.00.09) and
> their AM3352 ARMv7a processor.  We are using a Micron MT29F2G08ABBEAHC
> 2 Gb SLC NAND chip.  (w/ a BCH8 ECC)
> 
> We have 50+ devices deployed and over the deployment (40 days) we have
> seen ~10 of the devices go read only.  The devices are slowly going
> read only with no apparent correlation with uptime.  And the devices
> are running in inside environments.  Because the devices are deployed,
> we do not have easy or quick access to the kernel logs.  But I was
> able to capture one instance where the device went from RW to RO.  See
> the bottom for the dump.  (1)  The message seems pretty straight
> forward; there is a CRC mismatch between what was stored in NAND and
> what was calculated.  But I am a little stuck on why.
> 
> So far it seems that the options are:
> 
> 1.) Unstable bits: Our device has a 1 Ah back up battery and should
> have had very very few (< 3 ) bad power off events after it had the
> RFS put in NAND with ubiformat to its present state.   Additionally,
> the devices should have stayed on for the entire time they have been
> deployed.  (We are logging that from now on)
> 
> 2.) NAND/Driver Corruption: I have run the MTD oobtest and read test
> to near ad nauseum with almost perfect passing results.  In 500+
> iterations of each test, split on multiple devices, I saw one OOB
> verify error.  And since I enabled further debugging, I have not been
> able to reproduce it.  Additionally, I have gone through and verified
> that the GPMC (General Purpose Memory Controller) bus that connects
> the AM335x to the NAND chip is within the chip's timing requirements.
> 
> 3.) Memory Corruption: Is it possible the the write buffer can be
> corrupted before it is written to NAND?  Hence having a bad CRC value
> in NAND?

Well, the only obvious suggestion that I could get is that you should
find a way to reproduce the issue. Then you can try enabling I/O
debugging in UBI. And then adding various hacks around to narrow down
the problem. Depending on how quickly this is can bereproduced, you can
go as far as duplicating all the NAND writes to a file and comparing the
contents of NAND with the contents of file and finding when something
becomes corrupted... just a crazy idea.

You probably can check version 3 rather easily by reading the data from
your flash a different way and verifying the CRC.


-- 
Best Regards,
Artem Bityutskiy
