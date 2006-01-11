Received: from nproxy.gmail.com ([64.233.182.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ewjbg-0001k8-VU
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 12:17:59 -0500
Received: by nproxy.gmail.com with SMTP id m19so42868nfc
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jan 2006 09:17:55 -0800 (PST)
Message-ID: <6934efce0601110917t7be35d7bne3040030b4ac43b2@mail.gmail.com>
Date: Wed, 11 Jan 2006 09:17:54 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: James Hughes <JHughes@linx.co.uk>
In-Reply-To: <DB1B6B12D0E2F0469EB35A9586066B6ECE7999@stivesemail.stives.linx.gbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE7999@stivesemail.stives.linx.gbr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FW: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I have done exactlythat, changing the mapping to the correct place (very
> minor change). However, although the driver is being registered (printk
> confirms this), the probe function is never called to set up the flash. D=
oes
> anyone know why that may be the case? Is there something I haven't done i=
n
> the kernel set up? Anyone know the reasons why the probe callback may not=
 be
> called, even though a driver has been registered?

Is the map being registered?
Is the logic in the map ever executing the probe?
You'll have to debug that first.
