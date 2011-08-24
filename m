Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwDKc-0005vq-6T
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 13:17:23 +0000
Received: by gwb1 with SMTP id 1so1037343gwb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 06:17:19 -0700 (PDT)
Subject: Re: [PATCH 3/5] mtd: remove MEMSETOOBSEL macro definition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 24 Aug 2011 16:19:05 +0300
In-Reply-To: <Pine.LNX.4.64.1108241427380.13510@lnxricardw.se.axis.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
	<1314145056-5233-3-git-send-email-computersforpeace@gmail.com>
	<Pine.LNX.4.64.1108241427380.13510@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314191951.9480.277.camel@sauron>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-24 at 14:28 +0200, Ricard Wanderlof wrote:
> On Wed, 24 Aug 2011, Brian Norris wrote:
> 
> > MEMSETOOBSEL is completely unused and useless. Remove the definition.
> >
> > Note: it's probably best not to use this ioctl number in the future for
> > MTD, since that may cause conflicts between old kernels and new user
> > software (or new kernels and old user software). This shouldn't be much
> > problem.
> 
> Perhaps this should be noted as a comment in the code, rather than just 
> removing the line. Such information tends to get forgotten sooner or later 
> otherwise.

Yeah, I've amended the patch and added a comment:

+/*
+ * Note, the following ioctl existed in the past and was removed:
+ * #define MEMSETOOBSEL           _IOW('M', 9, struct nand_oobinfo)
+ * Try to avoid adding a new ioctl with the same ioctl number.
+ */

-- 
Best Regards,
Artem Bityutskiy
