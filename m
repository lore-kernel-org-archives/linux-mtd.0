Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1333C07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 07:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819AE613C0
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 07:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819AE613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=inbox.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6MU6cDF4ORJ/SfSlX5egH8ieW+IAERMJqYtcha3W+Ws=; b=4weBktAkNep5xgTRdhQrP+1ZCu
	J6OUCrMkq2Q1HYwoKhTn++mrPNi8rsm3pAHmybF3Nfs+L7v+B67eYowMWWW+gHe7cB7TTlgKRqVoD
	SmnEaqMXtzl4iyZSoYwINeXVg3lY/7Fegrfds3M7fKEpeIQLK6nQkGH6laHsNGDTqGO1fKTQoxJM8
	CRcqbH6IRuvT9ht82Hwk0EU5XWlBkSQ/Uog5cl8Qq3u2vtyCB9XvkASHtAC2mHd0CN+nRtLW2aPum
	cnMvqqLD130yogYBigo8W2RlPdvSWsd5ECgSgwcCyinOR7vqolzFuQJrNZcKFW4MIhuBRYYODL/IB
	wBGo4e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Hxr-003TAw-Kr; Fri, 16 Jul 2021 07:08:51 +0000
Received: from smtp50.i.mail.ru ([94.100.177.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Hxm-003T9c-LS
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 07:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=8aOUZl1WW3sPcZWWLYkjdKb1jWkrGGr4rZg8VW8xSa0=; 
 t=1626419326;x=1627024726; 
 b=rQ9+hu1ANIz5OllrKWtEa8PQd316yPkXnGpfi4Ufnv4r2t/hM1dwt64vEgU3Q6OpJjMuxxVFf7gH6ZFXkI/cBb/y8mpyvHlAtmImvgZB68RfMWEEjswWqVTGoKWsO6kFnSxKZ8Q8X4UQRIiSkmcryYaEnGiFPNzzoAdrRcxcDcw=;
Received: by smtp50.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m4Hxf-0003Mg-U3; Fri, 16 Jul 2021 10:08:40 +0300
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, richard.genoud@gmail.com
From: Maxim Kochetkov <fido_max@inbox.ru>
Subject: ubifs error at boot "bad node type" again
Message-ID: <5b0eb0ef-78a7-2dfb-9aa9-7ba8295c6b52@inbox.ru>
Date: Fri, 16 Jul 2021 10:10:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
Authentication-Results: smtp50.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C386C8E0DDEE7E2465E4A01A82547D9FE1182A05F5380850404C24151EE716988264451A1555E05082A3635A9FD6B6ABD65F615A1D27F801E0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE712EB008F780777E9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379108F895B68B2FFD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8941287C7343C340BCF52DFF623BE7A626F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE0CA84E883F322C13AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637B5B250D1A2E74821D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16BC6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CAA8DC07915BC95B78861405B6FE504232AABFD1A11B7A7819C2B6934AE262D3EE7EAB7254005DCED9E37F5E5AAD3F7B01E0A4E2319210D9B64D260DF9561598F01A9E91200F654B069F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3429499E429979B7C7AAABA85D845F315475D32403C3B1609E86B948587F0B16C9AFFF390C2D28E1EF1D7E09C32AA3244C5A371F48BA8FFB6ACDBCA07155F5AFF96C24832127668422FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojk34dk3RWCsZZEQ88/9rlVA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24F6B66322CEDF2EB15595D41D72F6CFCE39C604822A045087EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_000847_295091_1A7EF666 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Hi, Richard, All!



I faced with corruption of UBIFS partition.



I have a small 16Mb UBIFS on mtd partition on SPI NOR flash.

This partition contain some my own binary applications:

drwxrw-rw-    2 197608   197121      1.2K Jan 10 23:29 .

drwxr-xr-x   19 root     root           0 Jan 10 23:28 ..

-rwxrw-rw-    1 197608   197121    652.1K Jun 22  2021 dmr_ccl.elf

-rwxrw-rw-    1 197608   197121    942.6K Jun 22  2021 dmr_core.elf

-rwxrw-rw-    1 197608   197121    162.7K Jun 22  2021 dmr_fdrcontrol.elf

-rwxrw-rw-    1 197608   197121     42.2K Jun 22  2021 dmr_monitor.elf

-rwxrw-rw-    1 197608   197121      1.2M Jun 22  2021 dmr_pdsi.elf

-rwxrw-rw-    1 197608   197121    235.2K Jun 22  2021 dmr_registrator.elf

-rwxrw-rw-    1 197608   197121    832.1K Jun 22  2021 dmr_sip.elf

-rwxrw-rw-    1 197608   197121    243.6K Jun 22  2021 dmr_sma44d.elf

-rwxrw-rw-    1 197608   197121     98.6K Jun 22  2021 dmr_smtuts.elf

-rwxrw-rw-    1 197608   197121      1.2M Jun 22  2021 dmr_trcontrol.elf

-rwxrw-rw-    1 197608   197121    411.2K Jun 22  2021 dmr_trunk.elf

-rwxrw-rw-    1 197608   197121    449.5K Jun 22  2021 dsp.prg

-rwxrw-rw-    1 197608   197121       509 Jun 22  2021 startup.sh

-rwxrw-rw-    1 197608   197121     40.9K Jun 22  2021 svcmon

-rwxrw-rw-    1 197608   197121      1.1K Jun 22  2021 svcmon.conf



svcmon is runnig in background, kicking wathdog and 
start/restart/monitor other *.elf programms.



In usual way everything works fine. The problem starts with software update.

My current update scenario is:

1. Kill all my *.elf process but keep svcmon

2. Remove all *.elf and svcmon from storage

3. Write new *.elf and svcmon to storage (with sync after write)

4. svcmon starts new *.elf binaries



 From this point UBIFS can't be remounted to read-only because old 
svcmon is still running.



So at reboot this partition can't be unmounted/remounted as read-only.

After reboot sometimes I get UBIFS corruption by two scenarios:



1. Lost some files

----------------------------------------------------------------

[   85.978345] UBIFS error (ubi1:0 pid 258): 0xc01a5df4: bad node type 
(0 but expected 1)

[   86.002402] UBIFS error (ubi1:0 pid 258): 0xc01a5e1c: bad node at LEB 
17:17352, LEB mapping status 1

[   86.030010] Not a node, first 24 bytes:

[   86.030076] 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00                          ........................

[   86.080359] CPU: 0 PID: 258 Comm: dmr_core.elf Tainted: G         C 
      5.13.0.3 #3

[   86.104302] Hardware name: Generic DA850/OMAP-L138/AM18x

[   86.120378] Function entered at [<c000de24>] from [<c000c11c>]

[   86.138057] Function entered at [<c000c11c>] from [<c01a5e3c>]

[   86.155707] Function entered at [<c01a5e3c>] from [<c01be63c>]

[   86.173346] Function entered at [<c01be63c>] from [<c01a8848>]

[   86.190979] Function entered at [<c01a8848>] from [<c019c19c>]

[   86.208613] Function entered at [<c019c19c>] from [<c019c7fc>]

[   86.226240] Function entered at [<c019c7fc>] from [<c006e674>]

[   86.243870] Function entered at [<c006e674>] from [<c006f72c>]

[   86.261500] Function entered at [<c006f72c>] from [<c00879c8>]

[   86.279125] Function entered at [<c00879c8>] from [<c008a30c>]

[   86.296764] Function entered at [<c008a30c>] from [<c000e444>]

[   86.314397] Function entered at [<c000e444>] from [<c000e6e4>]

[   86.332033] Function entered at [<c000e6e4>] from [<c0009444>]

[   86.349651] Exception stack(0xc3f17fb0 to 0xc3f17ff8)

[   86.364975] 7fa0:                                     00135bf0 
00010000 bed57e4c 00000900

[   86.389653] 7fc0: 0010a000 00135bf0 00000015 00000001 bed57e44 
bed57e4c b6fb7fbc 00000000

[   86.414317] 7fe0: b6903f70 bed57cb8 00066d58 000b66b0 80000010 ffffffff

-----------------------------------------------------------------



In this case some of *.elf binaries is corrupted and cannot be even 
read/copied, failed with IO error.



2. Totally corrupted partition

-----------------------------------------------------------------

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.836316] ubi0: default 
fastmap pool size: 8

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.836407] ubi0: default 
fastmap WL pool size: 4

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.836446] ubi0: 
attaching mtd3

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.908650] ubi0: scanning 
is finished

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942161] ubi0: attached 
mtd3 (name "CONFIG", size 4 MiB)

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942254] ubi0: PEB 
size: 65536 bytes (64 KiB), LEB size: 65408 bytes

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942305] ubi0: 
min./max. I/O unit sizes: 1/256, sub-page size 1

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942338] ubi0: VID 
header offset: 64 (aligned 64), data offset: 128

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942371] ubi0: good 
PEBs: 64, bad PEBs: 0, corrupted PEBs: 0

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942403] ubi0: user 
volume: 1, internal volumes: 1, max. volumes count: 128

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942435] ubi0: max/mean 
erase counter: 8/3, WL threshold: 4096, image sequence number: 2547763139

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.942477] ubi0: 
available PEBs: 0, total reserved PEBs: 64, PEBs reserved for bad PEB 
handling: 0

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.945775] ubi0: 
background thread "ubi_bgt0d" started, PID 101

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.968871] ubi1: default 
fastmap pool size: 10

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.968965] ubi1: default 
fastmap WL pool size: 5

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    7.969004] ubi1: 
attaching mtd4

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.250958] ubi1: scanning 
is finished

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285144] ubi1: attached 
mtd4 (name "BOOT", size 16 MiB)

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285240] ubi1: PEB 
size: 65536 bytes (64 KiB), LEB size: 65408 bytes

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285287] ubi1: 
min./max. I/O unit sizes: 1/256, sub-page size 1

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285324] ubi1: VID 
header offset: 64 (aligned 64), data offset: 128

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285358] ubi1: good 
PEBs: 256, bad PEBs: 0, corrupted PEBs: 0

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285391] ubi1: user 
volume: 1, internal volumes: 1, max. volumes count: 128

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285424] ubi1: max/mean 
erase counter: 51/37, WL threshold: 4096, image sequence number: 374788538

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.285466] ubi1: 
available PEBs: 0, total reserved PEBs: 256, PEBs reserved for bad PEB 
handling: 0

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.292788] ubi1: 
background thread "ubi_bgt1d" started, PID 103

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.312014] ubi2: default 
fastmap pool size: 60

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.312106] ubi2: default 
fastmap WL pool size: 30

Jan 10 07:44:52 RMU-H3 user.notice kernel: [    8.312143] ubi2: 
attaching mtd7

Jan 10 07:44:53 RMU-H3 user.notice kernel: [    8.909857] random: crng 
init done

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.620589] ubi2: scanning 
is finished

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658660] ubi2: attached 
mtd7 (name "OTHER", size 75 MiB)

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658755] ubi2: PEB 
size: 65536 bytes (64 KiB), LEB size: 65408 bytes

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658803] ubi2: 
min./max. I/O unit sizes: 1/256, sub-page size 1

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658839] ubi2: VID 
header offset: 64 (aligned 64), data offset: 128

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658872] ubi2: good 
PEBs: 1200, bad PEBs: 0, corrupted PEBs: 0

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658903] ubi2: user 
volume: 1, internal volumes: 1, max. volumes count: 128

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658936] ubi2: max/mean 
erase counter: 13/8, WL threshold: 4096, image sequence number: 4095774474

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.658977] ubi2: 
available PEBs: 0, total reserved PEBs: 1200, PEBs reserved for bad PEB 
handling: 0

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.662356] ubi2: 
background thread "ubi_bgt2d" started, PID 105

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.871311] UBIFS 
(ubi0:0): Mounting in unauthenticated mode

Jan 10 07:44:54 RMU-H3 user.notice kernel: [    9.872271] UBIFS 
(ubi0:0): background thread "ubifs_bgt0_0" started, PID 114

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.042857] UBIFS 
(ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "config"

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.042960] UBIFS 
(ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 
bytes/256 bytes

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.043021] UBIFS 
(ubi0:0): FS size: 3139584 bytes (2 MiB, 48 LEBs), max 58 LEBs, journal 
size 523265 bytes (0 MiB, 6 LEBs)

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.043078] UBIFS 
(ubi0:0): reserved for root: 148290 bytes (144 KiB)

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.043114] UBIFS 
(ubi0:0): media format: w5/r0 (latest is w5/r0), UUID 
B656412D-624A-4796-AC59-D679298A592B, small LPT model

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.255899] UBIFS 
(ubi1:0): Mounting in unauthenticated mode

Jan 10 07:44:54 RMU-H3 user.notice kernel: [   10.258067] UBIFS 
(ubi1:0): background thread "ubifs_bgt1_0" started, PID 123

Jan 10 07:44:55 RMU-H3 user.notice kernel: [   10.343017] UBIFS 
(ubi1:0): recovery needed

Jan 10 07:44:55 RMU-H3 user.err kernel: [   10.929408] UBIFS error 
(ubi1:0 pid 122): 0xc01ba8a8: corruption 0

Jan 10 07:44:55 RMU-H3 user.err kernel: [   10.929519] UBIFS error 
(ubi1:0 pid 122): 0xc01ab57c: corruption at LEB 223:23152

Jan 10 07:44:55 RMU-H3 user.err kernel: [   10.929578] UBIFS error 
(ubi1:0 pid 122): 0xc01ab5a4: first 8192 bytes from LEB 223:23152

Jan 10 07:44:55 RMU-H3 user.debug kernel: [   10.929666] 00000000: 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
................................

Jan 10 07:44:55 RMU-H3 user.debug kernel: [   10.929732] 00000020: 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
................................

Jan 10 07:44:55 RMU-H3 user.debug kernel: [   10.929790] 00000040: 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
................................

Jan 10 07:44:55 RMU-H3 user.debug kernel: [   10.929846] 00000060: 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
................................

---- all zeroes --------

Jan 10 07:44:55 RMU-H3 user.debug kernel: [   10.958370] 00001fe0: 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
................................

Jan 10 07:44:55 RMU-H3 user.err kernel: [   10.958404] UBIFS error 
(ubi1:0 pid 122): 0xc01ba5e8: LEB 223 scanning failed

Jan 10 07:44:55 RMU-H3 user.notice kernel: [   10.958725] UBIFS 
(ubi1:0): background thread "ubifs_bgt1_0" stops

--- failed to mount -> run ubiupdatevol -t ubi1_0 -----------

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.011277] UBIFS 
(ubi1:0): default file-system created

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.013982] UBIFS 
(ubi1:0): Mounting in unauthenticated mode

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.014936] UBIFS 
(ubi1:0): background thread "ubifs_bgt1_0" started, PID 129

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.150290] UBIFS 
(ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "boot"

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.150396] UBIFS 
(ubi1:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 
bytes/256 bytes

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.150454] UBIFS 
(ubi1:0): FS size: 15697920 bytes (14 MiB, 240 LEBs), max 250 LEBs, 
journal size 784896 bytes (0 MiB, 12 LEBs)

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.150512] UBIFS 
(ubi1:0): reserved for root: 741451 bytes (724 KiB)

Jan 10 07:45:12 RMU-H3 user.notice kernel: [   28.150546] UBIFS 
(ubi1:0): media format: w5/r0 (latest is w5/r0), UUID 
D7A58512-0AD3-413F-AF45-304398E9EFA8, small LPT model

--------------------------------------------------------------

In this case partition can't be even mounted. The only option is format 
this partition.



I understand that I should stop svcmon and all my other application 
before reboot/unmount partition.

But power cut can happens before I stop them all.



I guess this problem may be related to:

http://lists.infradead.org/pipermail/linux-mtd/2014-July/054561.html

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/fs/ubifs?h=next-20210716&id=4ab25ac8b2b5514151d5f91cf9514df08dd26938

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
