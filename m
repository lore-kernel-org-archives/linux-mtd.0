From: David Howells <dhowells@redhat.com>
In-Reply-To: <20090416150630.GR1760@mail.wantstofly.org>
References: <20090416150630.GR1760@mail.wantstofly.org>
	<5680.1239894019@redhat.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: Bug in physmap driver?
Date: Thu, 16 Apr 2009 16:09:41 +0100
Message-ID: <11416.1239894581@redhat.com>
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

> That would suggest that dev->resource[i].end is off-by-one?

Actually, that's a good question: should end be one after the last useful
addres, or should it be that last useful address?

David
