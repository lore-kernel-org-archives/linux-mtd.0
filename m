Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FOuVC-0000Fn-36
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 05:35:46 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
Content-Type: text/plain
Date: Thu, 30 Mar 2006 14:35:02 +0400
Message-Id: <1143714902.3579.31.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-30 at 11:57 +0400, Belyakov, Alexander wrote:
> Hello again!
> 
> As it was promised I have split patch with striping and related stuff
> into three parts.
Description is much better, thanks.

> But due to some properties of interleaving algorithm it is very likely
> get increased erase size in case of striping thre ore more devices with
> different size.
Brrr... The resulting eraseblock size is anyway increased. I guess you
wanted to say that one may end up with *substantially* increased
eraseblock size, right?

> 4.3. How to choose interleave size?
> Sub-devices should belong to different (independent) physical flash
> chips in order to get performance increase. Interleave size describes
> striping granularity and it is very important from performance point of
> view. Write operation performance increase should be expected only if
> the amount of data to be written larger than interleave size. For
> example, if we have 512 bytes interleave size, we see no write speed
> boost for files smaller than 512 bytes. File systems have a write buffer
> of well known size (let it be 4096 bytes). Thus it is not good idea to
> set interleave size larger than 2048 byte if we are striping two flash
> chips and going to use the file system on it. For NOR devices the bottom
> border for interleave size is defined by flash buffer size (64 bytes,
> 128 bytes, etc). But such a small values affects read speed on striped
> volumes. Read performance decrease on striped volume is due to large
> number of read sub-operations. Thus, if you are going to stripe N
> devices and launch a file system having write buffer of size B, the
> better choice for interleave size is IS = B / N or somewhat smaller, but
> not smaller than single flash chip buffer size.

> For NAND you should use page size as interleave size value.

Working with flashes, it is very handy to use a notion of the minimal
flash Input/Output unit size. For NOR flashes it is 1 byte (or even 1
bit, but better to think about it as 1 byte). For NAND flashes, this is
one NAND page in current MTD. For ECC-NOR flashes, this is something
like 16 bytes, for data flashes this is another and so on.

Its a pity that MTD Interface is not generic enough to provide this
value, but this is a question of time, I believe somebody will come up
with a patch (may be even you?).

So, to be generic, we have to say that the interleave size has to be
multiple to the minimal flash input/output unit size.

You mentioned file systems. I cannot talk about all of them, but at
least JFFS2's write buffer size is equivalent to the minimal I/O size of
the underlying flash. So, to benefit of your striping layer, filesystems
have to (roughly) multiply the write buffer size on the number of
striped flashes.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
