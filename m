Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E1DC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 10:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5541C20870
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 10:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qqv38Ta3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5541C20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6uwlcUVZKpM6uZl7Ehn+5vqu39+WjVrxCdcwL6Uyh1o=; b=Qqv38Ta35FCxuQtUoIlq0qdJE
	J8sSOphyDGUErOB47BG4M1R0WoyhoAr1ZZAg4nVVY2MBFr3IjTXHnkJOzv9ixmgc0aHHm6qpukilk
	P0enQVhq/PZ4viekW74zm6WGqW2fmq28HfRAMCoOak1ANsj/2BCDJ2kKidU0zaTWA7Nw0taN35ltR
	Q+SxzzCjV0Zd+iB+xWYDNmuohCF1k0qvOhaHpPc7V25e81TijpUf6++cZMuZkd8uVf60BzfU4YcO3
	fdCpIENKTE2uXEp6Sd9ve6CMJXS/X4Lbk6L7kiD69RkY8fMxwOVcwN143PisvOVxyWum4xZh2r8au
	T1VUy5SNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmFOz-0006id-2A; Wed, 23 Jan 2019 10:04:57 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmFOu-0006i0-Ow
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 10:04:55 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 83418A1713;
 Wed, 23 Jan 2019 11:04:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id Rx5cLTWMha2k; Wed, 23 Jan 2019 11:04:39 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
Date: Wed, 23 Jan 2019 11:04:36 +0100
MIME-Version: 1.0
In-Reply-To: <20190123103512.722095cd@bbrezillon>
Content-Type: multipart/mixed; boundary="------------22EE78BD8681B969DADF63F0"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_020453_114153_5B5EC0C3 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------22EE78BD8681B969DADF63F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.19 10:35, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 10:06:59 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> On 23.01.19 09:55, Boris Brezillon wrote:
>>> On Wed, 23 Jan 2019 09:23:47 +0100
>>> Stefan Roese <sr@denx.de> wrote:
>>>    
>>>>> This one doesn't, incremental mode (-i) should.
>>>>
>>>> Here you go:
>>>>
>>>> # ./nandbiterrs /dev/mtd5 -k -i
>>>> incremental biterrors test
>>>> Failed to recover 1 bitflips
>>>> Read error after 0 bit errors per page
>>>>
>>>> I'm still unsure how this helps here.
>>>
>>> It helps, it tells us the ECC doesn't work properly (fails to recover
>>> one bitflip), or maybe it's the raw accessors that don't don't work.
>>>    
>>>> Is there anything else I should test?
>>>
>>> Add traces to the get_ecc_status() func and print the status value.
>>
>> # ./nandbiterrs /dev/mtd5 -k -i
>> [   22.098436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>> [   22.117184] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>>
>> <snip many identical lines>
>>
>> [   23.085412] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>> incremental biterrors test
>> [   23.102973] gd5f1gq4u_ecc_get_status (124): status=0x20 status2=0x00
>> Failed to recover 1 bitflips
> 
> Hm, looks like the ECC reports error as soon as you start writing to
> the NAND. Maybe we have a problem in the write path...
> 
>> Read error after 0 bit errors per page
>>
>> Strange, this does not seem to match what the datasheet tells us. Any
>> further ideas what I should test?
> 
> Erase a block (save data before if you need to), write random data with
> the ECC enabled and dump it back (once in raw mode, once with ECC
> enabled):
> 
> # flash_erase /dev/mtdX 0 1
> # nandwrite --input-size=<pagesize> /dev/mtdX /dev/urandom
> # nanddump -f /tmp/dump-ecc -l <pagesize> -o /dev/mtdX
> # nanddump -f /tmp/dump-raw -l <pagesize> -o -n /dev/mtdX
> 
> Send me both dumps (plus the console output), and we'll see how it
> looks.

Here you go:

root@mt7688:~# flash_erase /dev/mtd5 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
Writing data to block 0 at offset 0x0
root@mt7688:~# nanddump -f /tmp/dump-ecc -l 2048 -o /dev/mtd5
ECC failed: 0
ECC corrected:[  100.171120] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
  0
Number of ba[  100.178436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
d blocks: 2
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 128
Dumping data starting at 0x00000000 and ending at 0x00000800...
root@mt7688:~# dmesg -c
[  100.171120] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
[  100.178436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
root@mt7688:~# nanddump -f /tmp/dump-raw -l 2048 -o -n /dev/mtd5
Block size 131072, page size 2048, OOB size 128
Dumping data starting at 0x00000000 and ending at 0x00000800...
root@mt7688:~# dmesg -c
root@mt7688:~#

The attached files are identical. Thanks for looking into this.

Thanks,
Stefan

--------------22EE78BD8681B969DADF63F0
Content-Type: application/octet-stream;
 name="dump-raw"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dump-raw"

ADGe3sUGfwGW4LRdtdTgQ1hjOEQTwW68k+i7HnGVUh8Yy5Bs2jhs/OIB2Yp3facthZ9dsOCg
yVcWaWQWd+iEipyUbEIDpn6FZA7bw1ys03P1ni07a3+ICYRVI2KflKdigfPKGq1lGGmRUxa5
JSsKZuAkcZnzN6+3VYhg4YRuZJqcjpk7vKVd+rCVk3mLjmzBpJl4bgtNlmh+VF7xOJJGOyw5
9hUBdkaFobElr8VDQtmXZLbWkGp5F2EHBu+EaBno2rT80gUJpqDDvv+TPSzpxjyYkR6v40Es
Wh41VmOSktkIpZJEdoIH0wnF0+KG03FAF5NIYqd4KD30Fqrx0MkG+2NZEwFnQMy+YvBH11wf
Rx8oYUBo+V0heQWnLLTewrei08fjDi8GQY4MQ1dICN6NOl+cM4gx9Fyt7IhCmOty+EsgJKDa
s98m58IJO6A1ei072+yqwxYa/yVdP3UWXd2Kem9Ja7UevlZ2WMOqbJ3QbNKjCqLQUsLwkcv2
9wULYUJzN8ALn9POthXEVIvRuvXsWGwFSpJevv+pr/TMFRMoArS6NBSAKK8/jDDNLrFE62U3
jO9eUEh/JScGLvqq+Lc6albz+cVBwGIdXEBP/jAzvbl4gC/6nKvLZgAMN4S2SnFfyXfWVOmp
5HgBjEGAUYRSH/BHiQX0ei+5RB2z/vZ2dMc2PXIQJJlh1IeNk2/74MwQ3DaaLyxkATh5U7tK
4JnIvvs24mZjeWIJRkszPqvYB3lMo2S+2zfpP0DGlA/m9V6B7hoOvnn56sMkZ0gSo1MCd3vH
+L+U2pHnWamto2D97M3m9XAIJExC78ldzL2ICG3ju53rhMSqpLVKh6LRPoHb8nQEyvyTvlSm
n2mDv9xTXayuNVDOezefbCKzmhd5fe4reQJ5Z6DpB1lsuvm4gYN+qB0hrSq0WhSDtCgufDex
AOLmVdQCW7Mja4i5yb2fuzCFh767HwV0S2Gc6Vplun9r/RPl+a7nN1F5EORxmmnJ/gqRmzNz
VksGnQqm4bRq1diNLIPEpLzMtzsVTADDH/yFpF6r0CsWwTFBo9hX1cXqko8/txCujcPEi0rc
fj/cU5GyVfPUuX3BSuoMFT/VRCLQqiVBnZqB3MRmdgcgtEgU2akEOhi7O7DreuG1G5OOsf9p
u+e23xWqS0PThsZTk7Z3eCLrxwhkdZ0GjahcNllvKADCHEbwplEs51cFoBMpZKvpqC4gXpwU
tJcSw3ich5C5XTDHwqRV2LFRqzFa3roC1Pg1nujtgO+BFZ1QJxK6UuDEpozMqw0IcpezSTzi
UvLFIOQYpDSB7rpkKfHkSPqRgeAZzy5SAea26xkVHDBiYCpMuOkulsUf31Py6IrJijz39lvb
3lHt9gkmpaZDPlI1NKDRx/WYwPsEKOFea1Im7v/g1Wjf/fAuaDJOt6+vmqkzEtgmFJWz8BZ1
dA2aGjJlKCEvcujTQv+ZeIWF27z6504xSIbPvTvzcKo3As6feVt1zEkEgGHkOAOlbn1PW25k
8iGLqnx+B+CP94qaH9tMFs10Y++/SZIG0aIHcbaN3PnsMEE0nBpZ+0FIRdjz6kbc2kDwJkV2
DpXai2VTnKrFXyTziRzWZgvxP4/PIg6zsd7ruogNtbXhz4SACNna13gMaKNJ0Dp/Q/Una09U
BZK2w4eIBYdIYNyDbjNTH0ww66a3vnnRXCfQjsBkjurfnTYVdOU8cwIezlWSwfUDB0tiBe8R
1HY2+IGoxR8XUY2FVhncoXvXw2S0bAypPxeB6Numd09Pxg1rQbROOQA8RU2JD2jrVfkSWZVV
4caQmLxKclUCjt4BWj82xUukOS4tDZ2k0XSIx/8TglM/q3Jp/mxZx7RwEDjZ+bVK6okOfro5
YK87xJk1oNvEKA5zdWLwzpaCdpueJ2BDdqlO1kASJ+lA2NSfp/Kg3FmFN8r2htPQJX8umrac
4i3+ZCP1epanJ6MuH4g+P3vJUp3WqTv4DcAKK8K7aO1Fi1N5sFX0iwl4HPvwCEg68pTTe90k
jxbiC3Rv8sWgIvFNTyLipsg8z0ZbwTdZlzwOwrcJJ7OUFFoVYsxiXXYMMPtrvKUcKihjDR0G
B+sC2wFBjQbY4yNwLXoo4uvxerGSoahn0pG3mzT26bSy/cc75HJvImbRAfQnt106UScmK7OV
ExgyLeUPP+7CLjFnujnlZoKm43T4A92KR2HJSNMBCE0qt3XcESc59IqI2DGLf2QrwFHERieM
DRTA8NY0vtVO9N3uPwt/y3O0IQ3osW+pdNOgnWadeBBDJ4cgQrf8HjQYpJp2xV8JA+bDO8qn
t36f8eNhW4jPyIPr8gT9i9TWQNstXpMVEq/GnfdT6DdNtSkmHxRAyXO2UVd74uO1la/Qt6zu
BVJ7BqhEL+hSMgKDW3FFmsibNfzGSdTVWXGdM7zQgwGVkusRxvoNjsNlXPH9afpD9XPTlG9x
zv5CkbU0KmzjMf3x176UuKv2fTzjY4r24trQNxEk6LcD/7E2bCU/m64/j3pNbpZtvDuiZcB6
C7MgQaMSrdXp9q/xsSgLNWwc3MOrPIiWgvxijgpKPBassv1Kzi5obt62KFfeMK3sX20phjoR
VbrPE9z9lXSl7aFMoJxWN1buuczBqbV9Ov/h5a7BYFC1FGL5+sRcjD+gd3dJfWfm6nJdf88B
UGiAXdGPVg/Wh3lVcwr+7YHpI4794zHPRGwjXcp1mOGdqfxl415Zr75bJ7d56nQ3xgcAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAP/y2XFD/aZ9l4CQrE9zcwD/sBp2mT0sfw7ttcG9Ly8A/0zp9vsSjrXBeZsSewwM
AP8STlXhTnCeBfc6Y2EQEA==
--------------22EE78BD8681B969DADF63F0
Content-Type: application/octet-stream;
 name="dump-ecc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dump-ecc"

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
AP8STlXhTnCeBfc6Y2EQEA==
--------------22EE78BD8681B969DADF63F0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------22EE78BD8681B969DADF63F0--

