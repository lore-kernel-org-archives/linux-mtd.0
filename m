Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDzXW-0000eE-PW
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2010 13:07:39 +0000
Received: by qwh6 with SMTP id 6so1299527qwh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Nov 2010 06:07:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1288855749.2075.7.camel@localhost>
References: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
	<1288855749.2075.7.camel@localhost>
Date: Thu, 4 Nov 2010 15:07:34 +0200
Message-ID: <AANLkTim-+_98Ezcn3dG5g0mzNLNVrkDKC2f_34A_n2pE@mail.gmail.com>
Subject: Re: ubi deadlock on .36+
From: Grazvydas Ignotas <notasas@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 4, 2010 at 9:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2010-11-03 at 23:30 +0200, Grazvydas Ignotas wrote:
>> Hi,
>>
>> there seems to be some issue with NAND on my OMAP3 board that causes
>> CRC errors on 2.6.36 and 2.6.37-rc1. Those seem to be triggering a bug
>> in UBI that makes it loop forever (or very long) printing this:
>>
>> uncorrectable error :
>> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
>> from PEB 0:512, read 512 bytes
>> uncorrectable error :
>> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
>> from PEB 68:512, read 512 bytes
>> UBI: run torture test for PEB 68
>> UBI: PEB 68 passed torture test, do not mark it a bad
>>
>>
>> here is full log of one minute session, after which I killed power:
>> http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup
>
> Hmm, could you please enable UBI debugging and provide me the logs? See
> here for some hints:
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport

done:
http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup2
