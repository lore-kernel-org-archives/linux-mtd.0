Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBviu-0000tj-EM
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 11:20:53 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701291736.01006.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
	<1170075745.9477.73.camel@sauron>
	<200701291736.01006.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jan 2007 17:36:10 +0200
Message-Id: <1170171370.9477.150.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more comment. Yo add a 'ubi_vtbl_updvol()' function which can only
change the update marker. But lets consider what you really need:

* set update marker
* clean update marker, set data length field (static-only, RAM-only),
clear the 'corrupted' flag (static-only, RAM-only).

Currently there is a 'ubi_vtbl_set_data_len()' function which sets data
length and clears the corrupted flag.

So I recommend:

* add a 'ubi_vtbl_set_upd_marker()' func - it can only set the
upd_marker flag.
* add a 'ubi_vtbl_clear_upd_marker()' func - it cleans the update
marker, set data length, and clears 'corrupted' flag.

And the 'UBI_VOL_UPD' and 'UBI_VOL_NOUPD' constant are not really
reasonable I guess - indeed, we have just a boolean flag - these
constants are overkill.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
