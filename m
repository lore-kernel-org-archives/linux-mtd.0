Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpZYd-0006Ov-8N
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 06:40:57 +0000
Received: by wgbdt14 with SMTP id dt14so2541849wgb.26
 for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2012 23:40:45 -0700 (PDT)
Date: Fri, 13 Jul 2012 09:40:36 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Noah Romer <Noah.Romer@watchguard.com>
Subject: Re: skip erase blocks when creating fs image from jffs2 partition?
Message-ID: <20120713094036.5ec6f572@rndtravel53.home.jungo.com>
In-Reply-To: <01A8FA6BB5F06344A6DE41FAA912A96404AFF5BB@MBX1.wgti.net>
References: <01A8FA6BB5F06344A6DE41FAA912A96404AFF5BB@MBX1.wgti.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 12 Jul 2012 20:02:01 +0000 Noah Romer <Noah.Romer@watchguard.com> wrote:
> Based on my reading of the docs, and some initial experimentation, it
> seems as though it's possible to create a usable raw image of a jffs2
> partition in which you skip both bad blocks and empty/erase blocks.

I guess you meant "extract" instead of "create".

> Is that understanding correct? Particularly with regards to whether or
> not the resulting image would be usable.

Yes, it is generally correct.

Pay attention to:
- The destination MTD should have same eraseblock size and page size.
- The destination partition has enough usable blocks to contain your
  extracted jffs2 image.
- The destination partition has to be erased, with the jffs2
  cleanmarkers written to the OOB (-j option of flash_erase).
  Meaning, you'll program only the inband data extracted from the source
  partition.
- When programming the extracted image to the destination mtd,
  do NOT program empty pages (entire page is 0xFF).
  See
   http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
   http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

Regards,
Shmulik
