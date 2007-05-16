Received: from nz-out-0506.google.com ([64.233.162.237])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoIIm-0005QX-0d
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:08:42 -0400
Received: by nz-out-0506.google.com with SMTP id i11so1245977nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 May 2007 05:08:15 -0700 (PDT)
Message-ID: <84144f020705160508t275cb379k71bdd21c9e7d3d6e@mail.gmail.com>
Date: Wed, 16 May 2007 15:08:15 +0300
From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Sender: penberg@gmail.com
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <20070516111840.GB20482@mail.shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070515151919.GA32510@lazybastard.org>
	<787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
	<20070516111840.GB20482@mail.shareable.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>,
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

On 5/16/07, Jamie Lokier <jamie@shareable.org> wrote:
> Given that the filesystem is still 'experimental', I'd concentrate on
> getting it stable before worrying about immutable and xattrs unless
> they are easy.

We will run into trouble if the on-disk format is not flexible enough
to accommodate xattrs (think reiser3 here). So I'd worry about it
before merging to mainline.
