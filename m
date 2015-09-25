Received: from mail-pa0-f48.google.com ([209.85.220.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfKrG-0002b0-Ik
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 04:43:42 +0000
Received: by pacex6 with SMTP id ex6so93902909pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 21:43:21 -0700 (PDT)
Message-ID: <1443156194.29967.21.camel@ubuntu.flightdata.com.au>
Subject: Re: UBI on dual NAND chips
From: Nathan Williams <nathan.williams@flightdata.com.au>
To: Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)"
 <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>
Date: Fri, 25 Sep 2015 14:43:14 +1000
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CAC4@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAC4@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-09-25 at 01:16 +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> Hi, 
> Do you already enable mtd_concat driver on your MLC NAND?
> For MLC NAND, I think, it is not suitable. 

I don't have any hardware yet. I'm still only investigating the
possibilities. At the moment it looks like we'll design hardware with
two NAND interfaces and see what we can get working. Perhaps we will
start with one chip and only use half of it until the paired pages issue
is resolved.
