Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwzYu-0004NO-RY
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 16:15:05 +0000
Received: by wyb28 with SMTP id 28so132523wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 08:15:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1299579097.2754.14.camel@localhost>
References: <AANLkTim9F8R10hn2hSrAtXt5hsHZmTYNER5gOOy-dC9U@mail.gmail.com>
	<1299579097.2754.14.camel@localhost>
Date: Tue, 8 Mar 2011 11:15:02 -0500
Message-ID: <AANLkTinxeYwkUSODB3p9zf2wUxjB+RYNc5c4ThMVFKei@mail.gmail.com>
Subject: Re: [PATCH] Handle high-order allocation failures in
	ubifs_jnl_write_data
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: t.stanislaws@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 8, 2011 at 5:11 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
>
> Matthew, I've massaged your patch a bit. The changes I've made are as
> follows.
>
> 1. Some more commentaries and some re-naming.
> 2. Kill the union.
> 4. Tweak patch commit message.
> 5. Allocate write reserve buffer dynamically
> 6. Allocate write reserve buffer only when mounting in R/W mode to
> =A0 save some RAM when we are in R/O mode.
> 7. Free the buffer when we are remounting to R/O mode and allocate it
> =A0 again when re-mounting to R/W mode.
>
> The patch is below. Please, let me know if you are OK with this patch.
> I've also pushed it to ubifs-2.6.git / master.
>

Looks great, thank you Artem!

--=20
Matthew L. Creech
