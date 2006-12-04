Subject: RE: MTD pointer alignment
From: David Woodhouse <dwmw2@infradead.org>
To: Gavin Lambert <gavinl@compacsort.com>
In-Reply-To: <030e01c71724$1c4a95a0$4800a8c0@gavinlpc>
References: <030e01c71724$1c4a95a0$4800a8c0@gavinlpc>
Content-Type: text/plain
Date: Mon, 04 Dec 2006 13:37:06 +0000
Message-Id: <1165239426.5253.11.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-12-04 at 10:43 +1300, Gavin Lambert wrote:
> Quoth Artem Bityutskiy [dedekind@infradead.org]:
> > On Wed, 2006-11-29 at 13:09 +1300, Gavin Lambert wrote:
> >> Given that mtdchar assumes that it can mess with the low 2 bits of
> >> the MTD pointer it keeps around with impunity, add_mtd_device in
> >> mtdcore.c should probably refuse to add any MTD device pointer that
> >> doesn't fall on a 4-byte boundary.
> > 
> > Hmm, I personally I do not understand what is this about.
> 
> In mtdchar.c, when an MTD character device is opened (mtd_open), its
> pointer value is assigned to file->private_data.  All subsequent
> operations then use the TO_MTD macro, which is defined as:
> 
> #define TO_MTD(file) (struct mtd_info *)((long)((file)->private_data) &
> ~3L)
> 
> (ie. masking off the lower two bits).  There's even a comment above that
> those bits have been hijacked for OTP modes, and it's expecting that
> alignment of the pointer is at least 32 bits.
> 
> While this is true for a standalone kalloc'd MTD structure, if the MTD
> structure is embedded within another structure then it is not
> necessarily the case.  Since struct mtd_info starts with a byte-sized
> field, the default padding rules say that the structure as a whole is
> allowed to start on a byte boundary (although on many arches it'll get
> 16-bit aligned regardless).  Hence the 32-bit alignment is most
> definitely *not* guaranteed.

That's news to me. If we don't always align to sizeof(int) and have
appropriate (i.e. three bytes) padding after the initial 'char' field,
then surely the 'int' fields are sometimes going to be misaligned?

What platform is this? Precisely how is it padded/aligned?

-- 
dwmw2
