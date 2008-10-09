In-Reply-To: <1223270688.8051.78.camel@sauron>
To: dedekind@infradead.org
Subject: Re: [RFC] Support for > 2Gib MTD
MIME-Version: 1.0
Message-ID: <OF9C9CDDAA.CE29A97E-ON882574DD.00672609-882574DD.00675F3E@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Thu, 9 Oct 2008 11:49:17 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Sorry for the lateness of this, had a couple of fires to put out in 
manufacturing this week :).

Artem Bityutskiy <dedekind@infradead.org> wrote on 10/05/2008 10:24:48 PM:

> Hi,
> 
> On Fri, 2008-10-03 at 13:36 -0700, Bruce_Leonard@selinc.com wrote:
> > Here's a rough idea of what I'm thinking.  In 
.../include/mtd/mtd-abi.h 
> > add new 64 bit structs like this:
> > 
> > +struct erase_info_user_64 {
> > +       uint64_t start;
> > +       uint64_t length;
> > +}
> > 
> > +struct mtd_info_user_64 {
> > +       ...
> > +       uint32_t flags;
> > +       uint64_t size;
> > +       ...
> > +}
> > 
> > These new structs would be identical to the old ones execept for the 
types 
> > on a few fields.
> 
> Please, add something like
> uint8_t padding[128]; /* Reserved for future, should be zeroed */
> to the new data structures.
>

Is this for future expandibility?
 
> >   To indicate that the new 64 bit interface is to be used 
> > I would introduce a new flag for 'struct mtd_info_user_XX->flags', 
> > something like this:
> > 
> > #define MTD_LARGE_SIZE 0x4000
> 
> No need for this. Because you'll change size of data structures and
> their layout, this is not going to be compatible anyway.
> 

How then would you indicate to user space that they need to use the new 
64-bit structures and IOCTLs?  How does using another bit in an existing 
'flags' field of a structure change the size and layout of the structure?

Bruce
