Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVjRp-00028I-Ck
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 02:44:46 -0400
Subject: Re: [PATCH 0/2] NAND: nandsim sector-wise allocation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
In-Reply-To: <17701.14724.377713.929566@vaishnavi.localdomain>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Oct 2006 09:44:34 +0300
Message-Id: <1160117074.13696.33.camel@sauron>
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

Hello Vijay,

On Thu, 2006-10-05 at 22:27 +0530, Vijay Kumar wrote:
> The present nandsim allocates memory equal to the size of the NAND
> flash during initialization in one shot. Thus it is impossible to
> simulate a 256MB NAND flash on a system with 128MB RAM.=20

Right, I've been bearing a plan to fix this since long, I was even
thinking to re-implement it and make it able to work with HDD to emulate
really huge NANDs. But, time, time ...

> For most testing purposes, only a part of the the NAND memory
> allocated in the simulator is used. This patch set modifies the
> simulator so as to allocate a NAND page when it is written to, and
> deallocates the page when it is erased. With this it is possible to
> simulate large NAND flash devices on computers with less RAM.

Well, the idea sounds nice.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
