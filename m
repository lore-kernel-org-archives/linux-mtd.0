Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va02C-0005Dq-1D
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 09:19:52 +0000
Received: by mail-we0-f175.google.com with SMTP id t61so4730526wes.20
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 02:19:27 -0700 (PDT)
Message-ID: <1382779164.5901.1.camel@karhu.quadriga.com>
Subject: Re: nor flash used in UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Qi Wang =?UTF-8?Q?=E7=8E=8B=E8=B5=B7?= "(qiwang)" <qiwang@micron.com>
Date: Sat, 26 Oct 2013 10:19:24 +0100
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A770AED67@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A77082AC5@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A77082DDB@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED11@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED44@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED67@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-10-10 at 08:28 +0000, Qi Wang 王起 (qiwang) wrote:
> But I want to say the potential risk is if low level driver program data to 
> this block, it will get “timeout error”. And the timeout period could be very 
> long(almost several minutes), during this period, any operation on NOR flash 
> cannot be accept. so program data to a erasure interrupted block isn’t a 
> sensible action. in order to avoid program a erasure interrupted block, 
> I suggest UBIFS can read this block before program data. the code changing as below:

Yes, reading first sounds like a good idea. Would you please send a
patch implementing it?

-- 
Best Regards,
Artem Bityutskiy
