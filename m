Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwF71-0004PY-EI
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 17:52:48 +0000
Received: by mail-pb0-f42.google.com with SMTP id uo5so8495039pbc.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Dec 2013 09:52:20 -0800 (PST)
Date: Thu, 26 Dec 2013 09:52:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Qi Wang =?utf-8?B?546L6LW3IChxaXdhbmcp?= <qiwang@micron.com>
Subject: Re: [PATCH 1/1]  MTD: UBI:  try to avoid program data to NOR flash
 after erasure interrupted
Message-ID: <20131226175213.GA15560@norris-Latitude-E6410>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A77082DDB@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED11@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED44@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770AED67@NTXXIAMBX02.xacn.micron.com>
 <1382779164.5901.1.camel@karhu.quadriga.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B1B97@NTXXIAMBX02.xacn.micron.com>
 <1383059901.29619.52.camel@sauron.fi.intel.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B220C@NTXXIAMBX02.xacn.micron.com>
 <1383296284.2722.73.camel@sauron.fi.intel.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770B943C@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A770B943C@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 23, 2013 at 02:03:16AM +0000, Qi Wang 王起 (qiwang) wrote:
> Sorry to interrupt your busy life. 

Yes, unfortunately Artem hasn't been too responsive lately.

> As you said in previous mail, I send my patch separately without
> quoting this e-mail. And I have send to you, but I never get  your
> reply. I am very confuse, no sure if is there anything wrong at the
> patch I send to you.
> Can you help explain to me?

I'm not really a UBI expert, but I doubt that there is a real problem
with your patch. Artem just hasn't had time to look at it again.

Although you have been waiting a while, I suppose the best option is
simply to wait some more. Artem tends to revisit patches eventually,
sometimes after several weeks/months.

Brian
