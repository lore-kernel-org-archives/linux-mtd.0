Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUYhp-00030m-0u
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 04:50:17 +0000
Received: by fxm22 with SMTP id 22so26308906fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jan 2010 20:50:10 -0800 (PST)
Subject: Re: Fail to mount ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Jan 2010 06:50:08 +0200
Message-Id: <1263271808.30988.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

On Mon, 2010-01-11 at 19:20 -0500, Jon Ringle wrote:
> I should be able to mount an empty ubi volume as ubifs right?
> But I get this on a freshly made volume:
> UBIFS error (pid 1493): check_lpt_crc: invalid crc in LPT node: crc
> cbcb calc cbfb
> 
> I'm not sure what to try now...

As this entry suggests:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

- validate your flash/driver with the MTD tests - looks like you have a
problem there.

> (initramfs) ubinfo -a
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:60
> Present UBI devices:            ubi0
> 
> ubi0
> Volumes count:                           2
> Logical eraseblock size:                 130944 bytes, f KiB

Hmm, this f KiB looks weird.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
