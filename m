From: David Howells <dhowells@redhat.com>
In-Reply-To: <20090416151433.GS1760@mail.wantstofly.org>
References: <20090416151433.GS1760@mail.wantstofly.org>
	<20090416150630.GR1760@mail.wantstofly.org>
	<5680.1239894019@redhat.com> <11416.1239894581@redhat.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: Bug in physmap driver?
Date: Thu, 16 Apr 2009 16:27:44 +0100
Message-ID: <13360.1239895664@redhat.com>
Sender: dhowells@redhat.com
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lennert Buytenhek <buytenh@wantstofly.org> wrote:

> The last useful address.  That's what the resource code expects, as
> e.g. two regions with start=00100000,end=00200000 and
> start=00200000,end=00300000 will conflict (registration of the second
> will fail), whereas if you change the end addresses to 001fffff and
> 002fffff, they will no longer conflict.

Okay, yes; you're right.  It no longer locks up.

Do you by any chance know what the 'width' field of struct physmap_flash_data
means?  Is it the total width of the data bus going to the flash chips?  Or is
it the width of each flash chip?

David
