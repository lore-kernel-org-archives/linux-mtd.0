Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
From: David Woodhouse <dwmw2@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080618121936.GD305@shareable.org>
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
	<48570D5A.1050906@call-direct.com.au> <48577212.9070004@parrot.com>
	<48584DE9.3000709@call-direct.com.au>
	<20080618121936.GD305@shareable.org>
Content-Type: text/plain
Date: Wed, 18 Jun 2008 13:33:28 +0100
Message-Id: <1213792408.26255.1215.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Iwo Mergler <iwo@call-direct.com.au>,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-06-18 at 13:19 +0100, Jamie Lokier wrote:
> Iwo Mergler wrote:
> > Forgive my ignorance - does that mean that not everything in JFFS2 is 
> > CRC protected?
> 
> I think every _individual_ record is CRC protected in JFFS2
> 
> _But_ that doesn't always detect file corruption.  If JFFS2 records
> don't match their CRC, they are treated as if not there.
> 
> If there's corrupt data records, that causes holes in files.  There's
> no I/O error reported to the application, just blocks of zero bytes.
> 
> There's no mechanism in JFFS2 to detect that.  It requires checksums
> at a higher level

Well, in the case where a given region of the file is actually _absent_,
rather than the 'hole' being filled by an earlier version of the data
for that range of the file, we _could_ at least bitch about it, or maybe
even return -EIO. It should never happen, because of the way we 'fill'
holes in files.

It doesn't solve the real issue at hand though.

-- 
dwmw2
