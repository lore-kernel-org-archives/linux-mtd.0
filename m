Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSL35-00085W-Us
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 07:45:56 +0000
Message-ID: <1425282331.26652.23.camel@sauron.fi.intel.com>
Subject: Re: Unbounded update to a UBI volume
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Nam Nguyen <namnguyen@google.com>
Date: Mon, 02 Mar 2015 09:45:31 +0200
In-Reply-To: <CA+YNSmVuL+xRd5X0NWj_VCgPBDq9=7mZcqhRaNR1PmRrYL3szg@mail.gmail.com>
References: <CA+YNSmVuL+xRd5X0NWj_VCgPBDq9=7mZcqhRaNR1PmRrYL3szg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-02-26 at 15:30 -0800, Nam Nguyen wrote:
> Hello list,
> 
> The argument to IOCVOLUP is the size of the update.  In case of an
> update from a stream, such as from a BZip'ed source, this size is
> often not known ahead of time.  Is there a way to programmatically
> clear the update marker, without having to pad the volume up to its
> size, hence saving unnecessary writes?

I guess you'd need to implement a separate interface for this. It would
work a bit differently, and it would not work for static volumes.
