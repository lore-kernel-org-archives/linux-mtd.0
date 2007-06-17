Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HzuGX-00083k-Ve
	for linux-mtd@lists.infradead.org; Sun, 17 Jun 2007 08:54:04 -0400
Subject: Re: [PATCH]is_power_of_2-mtd/ubi/build.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: vignesh.babu@wipro.com
In-Reply-To: <1181624466.3109.23.camel@merlin.linuxcoe.com>
References: <1181624466.3109.23.camel@merlin.linuxcoe.com>
Content-Type: text/plain; charset=utf-8
Date: Sun, 17 Jun 2007 15:53:54 +0300
Message-Id: <1182084834.4403.19.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Kernel Janitors List <kernel-janitors@lists.osdl.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-12 at 10:31 +0530, vignesh babu wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2

Committed to UBI git tree, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
