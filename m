Received: from nz-out-0506.google.com ([64.233.162.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho6PL-0003TO-2l
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 19:26:19 -0400
Received: by nz-out-0506.google.com with SMTP id i11so904949nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 May 2007 16:26:17 -0700 (PDT)
Message-ID: <787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
Date: Tue, 15 May 2007 19:26:17 -0400
From: "Albert Cahalan" <acahalan@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <20070515151919.GA32510@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070515151919.GA32510@lazybastard.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please don't forget the immutable bit. ("man lsattr")
Having both, BSD-style, would be even better.
The immutable bit is important for working around
software bugs and "features" that damage files.

I also can't find xattr support.
