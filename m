Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1ITO-0002EG-0A
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 16:28:46 +0000
Message-ID: <1389284901.2259.144.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1]  MTD: UBI:  avoid program operation on  NOR flash
 after erasure interrupted
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Qi Wang =?UTF-8?Q?=E7=8E=8B=E8=B5=B7?= "(qiwang)" <qiwang@micron.com>
Date: Thu, 09 Jan 2014 18:28:21 +0200
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A770C7770@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A770B54B1@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B68A8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B6F77@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B79C8@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B8611@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA389@NTXXIAMBX02.xacn.micron.com>
 <1388675460.25123.90.camel@sauron.fi.intel.com>
 <1388676172.25123.93.camel@sauron.fi.intel.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA889@NTXXIAMBX02.xacn.micron.com>
 <1388728253.25123.98.camel@sauron.fi.intel.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770C7770@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-01-09 at 01:35 +0000, Qi Wang 王起 (qiwang) wrote:
> Hi Artem:
> Do you have any suggestion for my modification?
> Other code I think it is ok.

It is taken and pushed out. Thanks!

-- 
Best Regards,
Artem Bityutskiy
