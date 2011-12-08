Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYm18-0007af-K5
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 22:00:40 +0000
Received: by laam7 with SMTP id m7so550840laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2011 14:00:36 -0800 (PST)
Subject: Re: Back-porting latest code to Blackfin 2.6.34.7-ADI-2010R1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Fri, 09 Dec 2011 00:00:35 +0200
In-Reply-To: <1323278916.12142.YahooMailNeo@web114614.mail.gq1.yahoo.com>
References: <1323278916.12142.YahooMailNeo@web114614.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323381636.2074.7.camel@koala>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-12-07 at 09:28 -0800, Reginald Perrin wrote:
> Hi folks,
> 
> We're using 2.6.34.7 from ADI without modification (meaning ADI's version).  When I check this version against the ubifs-v2.6.34.git that's the "official" version, there are definitely differences.
> 
> Does anybody know the status of the .34 tree and the reliability (I'm asking this same question @ ADI)?  Specifically, we're fighting corruption issues, trying to track down what might be corrupting the LEB structure.

Hi,

I think if you pull the back-port tree, than all kernel versions
should be the same in terms of reliability of UBI/UBIFS.

Artem.
