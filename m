Received: from wx-out-0506.google.com ([66.249.82.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjEjz-0003bB-MV
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 09:19:32 -0400
Received: by wx-out-0506.google.com with SMTP id t8so115780wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 May 2007 06:19:28 -0700 (PDT)
Message-ID: <acd2a5930705020619t4039b50cxd01cc3395edf12b3@mail.gmail.com>
Date: Wed, 2 May 2007 17:19:28 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: JFFS2 wrong data CRC message
In-Reply-To: <46388BF9.4060807@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46385786.5020804@nokia.com>
	<1178108604.2875.182.camel@pmac.infradead.org>
	<46388BF9.4060807@nokia.com>
Cc: linux-mtd@lists.infradead.org, ext David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/2/07, Adrian Hunter <ext-adrian.hunter@nokia.com> wrote:
> >
> > Because it's almost certainly harmless. It usually just means that you
> > rebooted or reset without cleanly unmounting -- and thus without the
> > writebuffer getting flushed to finish the node it was writing at the
> > time. So the data CRC fails, and the node is ignored.
> >
> Unfortunately I started with an empty flash and have not rebooted at all.

I'd suspect some caching issues.

Vitaly
