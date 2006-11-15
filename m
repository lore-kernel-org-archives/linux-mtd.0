Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkKgA-0005U7-JO
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 08:19:59 -0500
Received: by ug-out-1314.google.com with SMTP id m2so122412uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 05:19:45 -0800 (PST)
Message-ID: <625fc13d0611150519i20da920aub90ce4a69f61a507@mail.gmail.com>
Date: Wed, 15 Nov 2006 07:19:44 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: Mkfs.jffs2.c:68:21: sys/acl.h: No such file or directory
In-Reply-To: <Pine.LNX.4.64.0611151119350.5230@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
	<Pine.LNX.4.64.0611150853370.5230@lnxricardw.se.axis.com>
	<455AE636.20806@ak.jp.nec.com>
	<Pine.LNX.4.64.0611151119350.5230@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/06, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> > The attached patch enable mkfs.jffs2 to be configurable without any
> > modification of source code.
>
> After I submitted the patch I too was thinking about extending
> configuration to the Makefile.
>
> Your patch is obviously much better. I think it would be nice if it were
> included in the mtd-utils tree.

It has been committed as is.  The patch looked quite good.

josh
