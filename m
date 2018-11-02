Received: from alln-iport-4.cisco.com ([173.37.142.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIa3v-0007Oh-RX
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 14:04:37 +0000
Date: Fri, 2 Nov 2018 07:04:20 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Nikunj Kela <nkela@cisco.com>, David Woodhouse <dwmw2@infradead.org>,
 xe-linux-external@cisco.com, Rod Whitby <rod@whitby.id.au>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Make JFFS2 endianness configurable
Message-ID: <20181102140420.jiuhcsrahoeqe5vk@zorba>
References: <20181101225603.17806-1-nkela@cisco.com>
 <20181102000236.rqho7txtb7gv543t@zorba>
 <20181102003434.GW32577@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102003434.GW32577@ZenIV.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 02, 2018 at 12:34:34AM +0000, Al Viro wrote:
> On Thu, Nov 01, 2018 at 05:02:36PM -0700, Daniel Walker wrote:
> > 
> > 
> > 
> > On Thu, Nov 01, 2018 at 03:56:03PM -0700, Nikunj Kela wrote:
> > > This patch allows the endianness of the JFSS2 filesystem to be
> > > specified by config options.
> > > 
> > > It defaults to native-endian (the previously hard-coded option).
> > > 
> > > Some architectures benefit from having a single known endianness
> > > of JFFS2 filesystem (for data, not executables) independent of the
> > > endianness of the processor (ARM processors can be switched to either
> > > endianness at run-time).
> > > 
> > 
> > 
> > The description is pretty sad .. We have a product which we released that uses
> > JFFS2, and that product was release with a kernel in one endianness. Then later
> > on we decided to change the endianness and now we're stuck with a JFFS2
> > partition that has the wrong endiannes, in a released product. This patch allows
> > us to set the endianness to something different from the architecture setting.
> > 
> > So there a significant use case for the change, at least for Cisco.
> 
> FWIW, can't we detect it at mount time, as e.g. UFS does?

We're not JFFS2 (or even filesystems) experts, but we could make an attempt at
it.

Do you have any thought on how to implement it ? I was think abstracting the
endian functions in the nodelist.h

static inline jint16_t cpu_to_je16(jint16_t x) {
	if (check_big_endian()) {
		return cpu_to_be16(x);
	} else if (check_little_endian()) {
		return cpu_to_le16(x);
	}
}

but how would you setup the checking ?

This would also work well for when you have a filesystem image on say an
x86 machine. I found some sites that recommend using jffs2dump to convert the
endianness before you can mount it. You most likely wouldn't change the kernel
in that case, or wouldn't want to.

Daniel
