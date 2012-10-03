Received: from mail.free-electrons.com ([88.190.12.23])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJTTK-0007SY-TG
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2012 18:15:04 +0000
Date: Wed, 3 Oct 2012 20:14:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd-www: Add fastmap doc
Message-ID: <20121003201447.18ad7d2e@skate>
In-Reply-To: <1349191749-5247-1-git-send-email-richard@nod.at>
References: <1349191749-5247-1-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

Here is a quick review, with only minor comments.

On Tue,  2 Oct 2012 17:29:09 +0200, Richard Weinberger wrote:

> +<h2><a name="L_fastmap">Fastmap</a></h2>
> +<p>
> +Fastmap is an experimental and optional UBI feature, which can be enabled
> +by setting CONFIG_MTD_UBI_FASTMAP to 'y'.
> +Once enabled UBI evaluates the module parameter
> +"fm_autoconvert". If it is set to 1 (default is 0) UBI automatically enables
> +fastmap for any attached image. This means UBI creates a new internal
> +volume with the fastmap data such that next time the fast attach mode can be
> +used.
> +In the default configuration UBI will use the information stored in this
> +fastmap volume to accelerate the attach procedure.
> +If you want to test fastmap, set fm_autoconvert to 1 and attach a volume.</p>

It would probably be good to explain what happens when
fm_autoconvert=0. I guess that images are then not automatically
converted, but then how does one creates a new image that has the
fastmap feature built-in? I haven't followed the whole discussion, are
changes to mtd-utils tools like ubinize planned?

> +<h4><a name="L_fastmap_compat">Backwards compatibility</a></h4>
> +<p>The fastmap on-disk data structure makes use of delete compatible volumes,
> +therefore fastmap enabled images are fully backwards compatible with UBI

backwards -> backward (but I'm not 100%, I'm not a native speaker)

> +implementaions which do not support fastmap. The kernel will remove the fastmap

implementations

> +volumes and continue with scanning.
> +This includes not only v3.6- but also v3.7+ with this option disabled.
> +</p>
> +
> +<h4><a name="L_fastmap_tech">Technical design</a></h4>
> +
> +<p>A on-disk fastmap contains all information needed to attach the whole image,
> +namely all erase counter values, a list of all PEBs and their state, a list of
> +all volumes and their current EBA, ...
> +To avoid too much writes of the fastmap it contains also a list of PEBs which

it also contains

> +may have changed and need a full scan while attaching.
> +This list is called "fastmap pool" and has a fixed sized, 5% of the total
> +amount of PEBs. Using this technique UBI needs to write the fastmap only if the
> +pool contains no free PEBs. Otherwise it would have to write the fastmap each
> +time when the EBA of a volume has changed.</p>

each time when the EBA -> each time the EBA

> +<p>A fastmap consists of a super block (also known as anchor PEB) and payload
> +data which can life on any PEB.

life -> live.

> +The anchor PEB has to be located within the first 64 PEBs on the MTD device.
> +It contains pointers to the remaining PEBs which carry the actual fastmap
> +data. On modern NAND chips the whole fastmap fits into a single PEB.
> +Hence, the anchor PEB points to itself.
> +After loading the fastmap data, UBI attach information structure is created
> +from it

Nitpick: missing dot at end of sentence.

> +The attach process works as follows:
> +<ol>
> +	<li>UBI tries to find the fastmap anchor PEB,
> +	if no anchor PEB was found UBI performs  traditional full scan</li>
> +	<li>It follows the pointers stored in the anchor PEB and reads
> +	the fastmap payload data</li>
> +	<li>Then it performs a traditional scan only on PEBs in the pool
> +	instead of all PEBs</li>
> +</ol>
> +If UBI detects that the used fastmap is invalid or corrupted it automatically
> +falls back to scanning mode and performsa full scan.

performsa -> performs a

> +Using a CRC32 checksum and consistency checks of the internal UBI structures
> +UBI is able to detect whether a fastmap is invalid or not.
> +</p>
> +
> +<p>
> +A fastmap is written to the devices each time the fastmap pool becomes full
> +(no free PEBs are available), the volume layout changes or the image is
> +detached. One may wonder why writing at detach time is needed.
> +if UBI would not write a new fastmap at detach time all erase counter
> +modifications since the last fastmap are lost.

"since the last fastmap write" maybe?

> +</p>
> +
> +<h4><a name="L_fastmap_overhead">Overhead</a></h4>
> +<p>Is fastmap enabled UBI will reserve enough PEBs to carry two complete
> +fastmaps.

If fastmap is enabled UBI ...

> In practice on modern NAND chips two PEBs are reserved for fastmap.
> +</p>
> +<p>
> +There is also some runtime overhead, to guarantee that the new fastmap is valid
> +and conistent UBI has to take care that all IO which would cause EBA changes

consistent

> +are blocked while attaching. Depending on flash Chip this can take up to one

flash Chip -> flash chips

> +second. Therefore, fastmap makes only sense on fast and large flash devices
> +where a full scan takes too long. E.g. On 4GiB NAND chips a full scan takes
> +several seconds whereas a fast attach needs less than one second.</p>
>  
>  <h2><a name="L_ubidoc">More documentation</a></h2>
>  

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
