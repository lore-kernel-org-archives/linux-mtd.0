Received: from ey-out-1920.google.com ([74.125.78.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZVLF-00074u-5c
	for linux-mtd@lists.infradead.org; Mon, 25 Jan 2010 20:15:26 +0000
Received: by ey-out-1920.google.com with SMTP id 26so846122eyw.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jan 2010 12:15:18 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 25 Jan 2010 15:15:18 -0500
Message-ID: <e14c53d91001251215k5e7074d4lb579d43df530b94a@mail.gmail.com>
Subject: To remove UBI Control Device . . .
From: Lee Amirev <lee.amirev@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My system does not need to dynamically attach or detach MTD devices to
UBI.=A0 We can just attach all that we need through boot or module
parameters.=A0 Therefore, we don't need the UBI control device
(/dev/ubi_ctrl).=A0=A0 In order to prevent the device from existing, I
could simply comment out the misc_register and misc_deregister calls
in ubi_init or ubi_exit in /drivers/mtd/ubi/build.c.  Is this
sufficient?  Are there any unintended consequences in removing the
control device?
