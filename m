Received: from lnx500.hrz.tu-darmstadt.de ([130.83.156.225])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWew-00022r-T5
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:38:43 +0000
From: Tim Sander <tim01@iss.tu-darmstadt.de>
To: dedekind1@gmail.com
Subject: Re: ubiformat & linux 3.0.14-rt
Date: Wed, 18 Jan 2012 15:38:31 +0100
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <201201161559.44592.tim01@iss.tu-darmstadt.de>
 <1326896252.28477.17.camel@sauron.fi.intel.com>
In-Reply-To: <1326896252.28477.17.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201181538.33048.tim01@iss.tu-darmstadt.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

I just found out that the error i attributed to ubifs is most likely within 
the network code. Its just that after the ubiimage has been attached
the network was reconfigured. I first attributed it to the ubi code since this 
always happened so close to the ubiattach and was related with firmware update. 
Sorry for the noise and thanks for your support.

Tim
