Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X79pM-0004eg-46
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 20:59:56 +0000
Date: Tue, 15 Jul 2014 13:59:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/1] fs/ubifs/super.c: replace seq_printf by seq_puts
Message-Id: <20140715135932.879df4f901ac58338d387a35@linux-foundation.org>
In-Reply-To: <CAFLxGvyaye+hKGv5L9ZuZAwZNb7FaVpg_n-abSGAmPu+YDc+hQ@mail.gmail.com>
References: <1405452395-9296-1-git-send-email-fabf@skynet.be>
 <CAFLxGvyaye+hKGv5L9ZuZAwZNb7FaVpg_n-abSGAmPu+YDc+hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Fabian Frederick <fabf@skynet.be>, Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 Jul 2014 22:10:24 +0200 Richard Weinberger <richard.weinberger@gmail.com> wrote:

> On Tue, Jul 15, 2014 at 9:26 PM, Fabian Frederick <fabf@skynet.be> wrote:
> > Fix checkpatch warnings:
> > "WARNING: Prefer seq_puts to seq_printf"
> 
> Can you explain why seq_puts() is preferred over seq_printf()?

- puts is presumably faster

- puts doesn't go rogue if you accidentally pass it a "%".

- this patch actually made fs/ubifs/super.o 12 bytes smaller. 
  Perhaps because seq_printf() is a varargs function, forcing the
  caller to pass args on the stack instead of in registers.
