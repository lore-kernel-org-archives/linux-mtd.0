Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505BEA8118
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pY2815BxxPvcVvHg8fas5AdTjtNiGoMzZMSl2bIO4o=; b=RXjFLYVtRxp+xU
	MpYJ6drNKfj2z1Z3w2wt74dQgO4KqloVRzss/+mRYSEl9eaFxHH0INUoC8uGJW9/cA9zKpen9TltD
	w4nQHowA2m42sJ06+5vRAnQ6l430zwiiqGAUcqfpuwm0UHOJqLZp0ZluFUE8/QkvHp2sKb8yGyf8h
	f8aDpA1mjr+2jnAd89/smdOptlCFVs4KU9mq9O/jkArRoE9g/4vfA2HBUbe3HK9MholU3Xe7lqTkh
	PFKOpYUAaeHr+1wgkjNa11udeMQnfilejzbpVDenuM5f8YXdZLpPc/NZ/beUJ5Lp/eCDWkV1Lj9eC
	g22rRf8UyxoN9WLTJMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoWE-0000000H28E-2lqf;
	Tue, 10 Feb 2026 14:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoWD-0000000H27h-2ShU
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Feb 2026 14:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p5jdEGRSETwWwvPc3fo9kR41v8S2BTPITiM9G7qCdcc=; b=OIcfYWXRFO79PNk3YTVHdSHTbq
	mP2bssNGOfK7ixLcD9nvoNCRvyDKQ9Vj97QEx/6OsMTi+kaje+tv4F2NAQxpk2Lyrgg7rLK6+Q3vS
	kwLhEiqrS4PoogOmFMnc2hnBnGw0tqNZDda/0kAqHDK++OWtteIpt66pA9iW0Mk86cpjziXfCPmp5
	z4ShZnsR4Arki5yaH5SroRPDFGipbXJ9KlsnbGonDbPgCzoV9bMhWJALFQInz1EvCDlqxqC86fuY2
	gKRFk9oHrHcBxuq70rwPjM0+QXED/lq1U0EHQltfTV6DV1aoebP11Bn3BWQPPFBbjWZR99Li+0mHL
	mlRYJfAA==;
Received: from mx.dave-tech.it ([31.223.242.245])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoW3-00000008RdK-2i28
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 14:15:01 +0000
Received: from [192.168.0.180] (unknown [192.168.0.180])
	by mx.dave-tech.it (Postfix) with ESMTP id 5D98020083;
	Tue, 10 Feb 2026 15:14:30 +0100 (CET)
Message-ID: <f05f27ac-abaf-43fc-8f77-8f729741d03f@dave.eu>
Date: Tue, 10 Feb 2026 15:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PL353 NAND Controller - SW vs HW ECC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "amit.kumar-mahapatra@amd.com" <amit.kumar-mahapatra@amd.com>
References: <MI2P293MB02644DC5515E56A2539C65739765A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
 <87v7g4zz36.fsf@bootlin.com>
Content-Language: it
From: Andrea Scian <andrea.scian@dave.eu>
In-Reply-To: <87v7g4zz36.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_141500_016334_3E32A187 
X-CRM114-Status: GOOD (  39.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Dear Miquel,


Il 10/02/2026 11:12, Miquel Raynal ha scritto:
> Hi Andrea,
> 
> On 09/02/2026 at 11:37:37 GMT, Andrea Scian <andrea.scian@dave.eu> wrote:
> 
>> Dear all,
>>
>> I hope I don't annoying you by putting directly in CC, but these people are the one that were already involved in my patch to fix SW ECC support in PL353 NAND controller (mainly used in Xilinx/AMD Zynq7k SoC), and I think are the one that might help me with this follow-up.
>>
>> Our standard HW/SW validation procedure for BSPs includes (after some basic functional tests) raw NAND MTD tests.
>>
>> Usually we check ECC functionality with mtd_nandbiterrs but it's way
>> of testing ECC correction is quite obscure and unmaintained (see a
>> thread between me and Miquel on this mailing list in December 2025 on
>> this topic).
> 
> We stopped developing the kernel modules, for testing we advise to use
> the same tools from the mtd-utils test suite which are actively
> maintained.
> 
> nandbiterrs -i is the correct tool for testing your ECC engine. It works
> this way (from memory, maybe not 100% accurate, but that's the idea):
[snip]

Got it! This looks very similar to the kernel module and, in
fact, I got the same results, depending on the seed choosen.

With PL353 HW ECC with out seek (a.k.a. seed=0)

root@sw0005-devel:~# nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Failed to recover 1 bitflips
Read error after 2 bit errors per page

While with seed=1

root@sw0005-devel:~# nandbiterrs -i /dev/mtd0 -s 1
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/7
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
ECC failure, invalid data despite read success

As comparison, with SW ECC I got

root@sw0005-devel:~# nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted b[  117.677553] ecc_sw_hamming_correct: uncorrectable ECC error
iterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Failed to recover 1 bitflips
Read error after 2 bit errors per page

root@sw0005-devel:~# ./nandbiterrs -i /dev/mtd0 -s 1
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted [  127.793727] ecc_sw_hamming_correct: uncorrectable ECC error
biterror @ 0/7
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/5
Failed to recover 1 bitflips
Read error after 2 bit errors per page



>> We've thus moved to userspace nandflipbits which give much more
>> control on bitflip generation, making easier to understand if
>> everything's fine or not.
> 
> nandflipbits is more flexible but less automated. It works identically,
> except I believe it erases before rewriting in raw mode (which is a
> subtle difference, this may have an impact with some -rare- chips).
> 
>> By using this tool, I'm able to reproduce what I think is a PL353 HW
>> ECC malfunction, that I think is hardware related (there's some,
>> cryptic IMHO, errata on this) but I may be missing something and it
>> may be "just" a software bug There's also the obvious 3rd option:
>> PEBKAC. I'm doing something wrong with my test setup, either on
>> kernel/test configuration/usage or in hw setup ;-) )
> 
> I am interested by this errata, do you have a link? I do not remember
> seeing it when I worked on this controller.

For PL353, due the fact that it's an ARM IP, you need to look at their 
website:

https://developer.arm.com/documentation/rlnc000227/a

Refer to r2p1 IP revision which is affected by errata ID 721059
It's statement nr 3 says

"Some double error cases are not correctly identified as uncorrectable fail"

"90 double errors out of the 8485140 possible double error combinations 
are not correctly identified as
uncorrectable fail"

"All double errors in the data (8386560 possible errors) will be 
correctly identified as uncorrectable fail"

However, this is NOT my experience, as you can see from the above testing.

>> Step 1 - SW ECC
>>
>> Thanks to my patch (and mailing list review) now I can use SW Hamming ECC on Zynq7k based devices. So this test is about using software hamming ECC on (1 bit on 256 byte)
>>
>> This is the device tree
>>
>> &nfc0 {
>>    status = "okay";
>>    nand@0 {
>>      reg = <0x0>;
>>      #address-cells = <0x1>;
>>      #size-cells = <0x1>;
>>
>>      nand-ecc-mode = "soft";
>>      nand-ecc-algo = "hamming";
>>      nand-ecc-strength = <1>;
>>      nand-ecc-step-size = <256>;
>>
>>      nand-on-flash-bbt;
>>
>>      nand-bus-width = <8>;
>>      status = "okay";
>>
>>      partition@nand-ubi {
>>        label = "ubi";
>>        reg = <0x00000000 0x0>;
>>      };
>>    };
>> };
>>
>> To make it quick, I'm using just the first EB, with a simple string on it (in my case,
>> this is useful for testing on u-boot too, but this is for another separate thread ;-) )
>>
>> root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
>> Writing data to block 0 at offset 0x0
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|
>>
>> I'm now inserting one bitflip, which is detected and corrected as expected
>>
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
>> root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtst testing....|
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 corrected bitflip(s) at offset 0x00000000
>> 0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|
>>
>> With an additional bitflip, we have an uncorrectable error (and this is, again, expected)
>>
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
>> root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 1
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
>> 0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
>>
>> The same applies to another combination of bitflips (this will be useful later and don't look at ECC counters.. I had to reboot the system ;-) )
>>
>> root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
>> Writing data to block 0 at offset 0x0
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@0
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
>> 0x00000000: 6b 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |ktst testing....|
>>
>>
>>
>> Step 2 - PL353 HW ECC
>>
>> The device tree is now
>> &nfc0 {
>>    status = "okay";
>>    nand@0 {
>>      reg = <0x0>;
>>      #address-cells = <0x1>;
>>      #size-cells = <0x1>;
>>
>>      nand-ecc-mode = "hw";
>>      nand-ecc-strength = <1>;
>>      nand-ecc-step-size = <256>;
>>
>>      nand-on-flash-bbt;
>>
>>      nand-bus-width = <8>;
>>      status = "okay";
>>
>>      partition@nand-ubi {
>>        label = "ubi";
>>        reg = <0x00000000 0x0>;
>>      };
>>    };
>> };
>>
>> Please note that PL353 is not using nand-ecc-step-size property
>> correctly, but this is a secondary issue (this NAND device requires 1
>> bit on 512 byte, so it's fine anyway)
> 
> Can you elaborate? Looking at the driver, it takes the ECC configuration
> from the core (hence, usually from the DT), otherwise it falls back to
> what the chip advertises in terms of requirements, and finally it falls
> back to 1b/512B as default.

I tried with

&nfc0 {
	status = "okay";
	nand@0 {
		reg = <0x0>;
		#address-cells = <0x1>;
		#size-cells = <0x1>;

		nand-ecc-mode = "hw";
		nand-ecc-strength = <1>;
		nand-ecc-step-size = <256>;

		nand-on-flash-bbt;

		nand-bus-width = <8>;
		status = "okay";

		partition@nand-ubi {
			label = "ubi";
			reg = <0x00000000 0x0>;
		};
	};
};

But I still got

root@sw0005-devel:~# cat /sys/class/mtd/mtd0/ecc_step_size
512


Maybe I'm missing something, but it seems that even if PL353 get this 
from code/NAND requirements in pl35x_nand_attach_chip()

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/raw/pl35x-nand-controller.c#n948

In case of (host) HW ECC this gets later overwritten when initializing 
PL353 ECC controller in pl35x_nand_init_hw_ecc_controller()


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/raw/pl35x-nand-controller.c#n910

> 
>> root@sw0005-devel:/lib/modules# cat /sys/class/mtd/mtd0/ecc_step_size
>> 512
>>
>> Re-doing the same test as above
>>
>> root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
>> Writing data to block 0 at offset 0x0
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|
>>
>> One single bitflip is detected and corrected as expected:
>>
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
>> root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtst testing....|
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 corrected bitflip(s) at offset 0x00000000
>> 0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|
>>
>> a 2nd bitflip is detected as uncorrectable as expected:
>>
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
>> root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> 0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 0
>> ECC corrected: 1
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
>> 0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
>>
>> But there's some corner case, e.g. double bit flip that are detected (wrongly) as single bitflip and return wrong data:
>>
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 1@1
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 1
>> ECC corrected: 2
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 corrected bitflip(s) at offset 0x00000000
>> 0x00000000: 6a 76 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jvst testing....|
>>
>> Another full test from scratch (ECC corrected counter is bigger that expected because I had to try a few combination, without rebooting ;-) )
>>
>> root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
>> Writing data to block 0 at offset 0x0
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
>> root@sw0005-devel:~# nandflipbits /dev/mtd0 0@0
>> root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
>> ECC failed: 1
>> ECC corrected: 6
>> Number of bad blocks: 0
>> Number of bbt blocks: 4
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x00000000 and ending at 0x00000064...
>> ECC: 1 corrected bitflip(s) at offset 0x00000000
>> 0x00000000: 6b 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |ktst
>> testing....|
> 
> This is scary.
> 
>> Conclusions:
>>
>> IIUC with the results of the above test, we have an issue on PL353 because it cannot detect double bit errors (at least some combination of them) and, while this is a rare event on SLC NAND devices (that requires 1 bit ECC to guarantee 100k PE cycles), I think that this might give some catastrophic failures on field (because, AFAIK, upper MTD layers, like UBI, don't expect this situation).
>> Am I wrong?
> 
> If you use UBI on top, depending on where the bitflips are, they may be
> found due to UBI using checksums quite extensively, but this is clearly
> not the nominal case. This is a dangerous hardware bug.

Thanks for the confirm

>> I kindly ask to the MTD experts if I have to worry about this or if we
>> can assume that correcting 1 bit error is enough for this subsystem.
> 
> No, the expectation is a clear failure upon double bit errors. Be
> careful though, Hamming ECC engines carry *no guaranty* for 3 bit
> errors. Only 0, 1 and 2 are part of the scope, and 2 bit errors are
> uncorrectable, which means:
> - 0 bf, ok
> - 1 bf, ok + reporting 1 bf
> - 2 bf, NOK + reporting an error
> - more bf: no guarantee, usually returns incorrect data with a correct
> status

Thanks for pointing this out. I was not aware about the last case when 
using Hamming algo.
Probably we'll have to move to BCH, even if, IIRC, it requires more
CPU horsepower to do the job.

> What you observe is maybe the last case. If you read the whole page raw,
> maybe you are silently facing a 3 bit error case due to a lot of
> repetitions (?), it can be somewhere else in the page. Be very careful
> when testing with nanflipbits because the tool does not check for data
> integrity, unlike nandbiterrs, which does. Are you sure your disapproval
> of nandbiterrs is justified in the first place? 

No and I'm sorry about this. I misunderstand that there's 2 nandbiterrs, 
one that has the .ko suffix (unmaintained kernel module) and one that is 
without .ko provided as userspace too in mtd-utils ;-)

I'll use nandbiterrs provided by mtd-utils for the next tests.
Thanks for pointing me to the rigth tool to use :-)


> Could it be that the
> NAND chip you're testing with is a bit faulty/unstable and nandbiterrs
> returns errors where you do not expect them because of that?

My colleague and I had the same objection. For this reason I tested this 
on different SOMs, from different production lots and also with 
different SLC NAND devices (same nominal charateristics and nearly 100% 
compatible), from Winbond and Spansion.
The latest hardware I'm testing is one that has just comes out from 
factory (so the NAND has no more that 1-2 PE cycles, from our factory 
functional testing)

Also, I'm using the same hardware to test HW and SW ECC (plus the same 
binaries, apart from the two lines inside device tree that I've already 
highlighted).

Due the fact that we're using the same algo (apart from ECC block size) 
I think that this guarantee that, from the hardware point of view, we 
don't have any issue, but please correct me if I'm doing some wrong 
assumption.

> This is obviously just speculation, maybe the errata you mentioned above
> will bring an obvious hardware failure to our attention. The Arasan IP
> used on ZynqMP also suffers from a similar limitation (not able to
> correctly report failures) and I decided to implement one path using the
> software BCH engine, with a time penalty of course.

So that's nearly the same result I'm trying to get with Zynq7k platform ;-)

I'm trying to match this SW ECC support also with U-Boot (and I'm having 
some trouble about it, but I think this needs a separate thread or 
moving to another mailing list).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
