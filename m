Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu2U5-0002gf-Iv
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 04:00:07 -0500
Subject: Re: Yet Another UBI Question
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
References: <B1EDF20A6EAAD74EA65E46F774F1784502B64384@orsmsx413.amr.corp.intel.com>
	<B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 Nov 2007 10:59:33 +0200
Message-Id: <1195462773.1119.0.camel@sauron>
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

On Wed, 2007-10-24 at 15:39 -0700, Johnson, Charles F wrote:
> Is there exist yet a block driver which sits on top of UBI so that you
> could use one of the traditional file systems such as ext3 or vfat?

Hi, no, there are no such drivers, unfortunately. But writing one is
much easier on top of UBI then on top of a bare flash.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
