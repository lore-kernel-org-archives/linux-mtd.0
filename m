Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA2CD-0003Pu-72
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 13:00:13 +0000
Subject: Re: [PATCH 2/4] UBI WL-Subsys: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1228823094.2753.14.camel@localhost.localdomain>
References: <1228823094.2753.14.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Dec 2008 14:58:00 +0200
Message-Id: <1228827480.13686.182.camel@sauron>
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

On Tue, 2008-12-09 at 19:44 +0800, xiaochuan-xu wrote:
> +/*
> + * It's impossible that the first field of rb_node structure is equal to=
 0x2
> + * and 0x3, so Ox2 is used to check whether the physical eraseblock is i=
n one
> + * of prot lists or not. 0x3 is used for prot list head's mark.
> + */
> +#define PROT_LIST_NODE 0x2
> +#define PROT_LIST_HEAD 0x3

This is hacky a bit. AFAIK, rb-tree code does have optimizations which
use the lowest bits of pointers, so I am not sure 2 and 3 are completely
impossible.=20

But I think this is anyway not needed at all. The only reason you need
this is to quickly find out if the entry is in the protection list or
not, right? And from the code I see the only user of this is the
'paranoid_check_in_prot_lists()' function. But this is just a debugging
function, which is normally compiled out. You do not have to optimize it
at all. Just let it walk the list and check.

So, please, let's get rid of these constants.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
