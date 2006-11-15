Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkHtG-0003f4-8t
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 05:21:16 -0500
Date: Wed, 15 Nov 2006 11:23:07 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: Mkfs.jffs2.c:68:21: sys/acl.h: No such file or directory
In-Reply-To: <455AE636.20806@ak.jp.nec.com>
Message-ID: <Pine.LNX.4.64.0611151119350.5230@lnxricardw.se.axis.com>
References: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
	<Pine.LNX.4.64.0611150853370.5230@lnxricardw.se.axis.com>
	<455AE636.20806@ak.jp.nec.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 15 Nov 2006, KaiGai Kohei wrote:

> The access control list(ACL) enables higher flexible access control
> ...

Thanks for the clarification.

> I don't oppose that you like to make the mkfs.jffs2 configurable.
> But it is not certain whether you don't need to enable the ACL feature
> _only_, or the whole of xattr feature.
> 'HAVE_ACL' is misnamed, if you intend to disable the whole of xattr
> feature. Or, the scope of disabling is wrong, if you intend to disable
> the ACL feature only.
> In addition, it is a bit messy to require modifying the source code
> to enable or disable xattr feature.

I agree totally. The patch I submitted was a quick fix to get it to=20
work in our environment, without really knowing what was going on.

> The attached patch enable mkfs.jffs2 to be configurable without any
> modification of source code.

After I submitted the patch I too was thinking about extending=20
configuration to the Makefile.

Your patch is obviously much better. I think it would be nice if it were=20
included in the mtd-utils tree.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
