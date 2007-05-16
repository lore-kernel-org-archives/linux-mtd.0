Received: from wr-out-0506.google.com ([64.233.184.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoIlZ-0007YO-Af
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:38:49 -0400
Received: by wr-out-0506.google.com with SMTP id 55so168933wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 May 2007 05:38:04 -0700 (PDT)
Message-ID: <84144f020705160538n28f77865u37fcf15578357c35@mail.gmail.com>
Date: Wed, 16 May 2007 15:38:03 +0300
From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Sender: penberg@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070515151919.GA32510@lazybastard.org>
	<Pine.LNX.4.64.0705161319060.5152@sbz-30.cs.Helsinki.FI>
	<20070516122603.GE5472@lazybastard.org>
	<84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
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

On 5/16/07, Pekka Enberg <penberg@cs.helsinki.fi> wrote:
> Forgot to add (see below). Seems logfs_segment_read would be simpler
> too if you fixed this.

Blah. Just to be clear: I forgot to add a "(see below)" text in the
original review comment.
