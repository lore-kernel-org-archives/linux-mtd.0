Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdhkD-0004BZ-33
 for linux-mtd@lists.infradead.org; Mon, 13 Oct 2014 15:41:09 +0000
Message-ID: <1413214845.7906.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nandsim: add id_bytes module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Akinobu Mita <akinobu.mita@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Mon, 13 Oct 2014 18:40:45 +0300
In-Reply-To: <1413208135.7906.24.camel@sauron.fi.intel.com>
References: <1407713341-4446-1-git-send-email-akinobu.mita@gmail.com>
 <1413208135.7906.24.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-13 at 16:48 +0300, Artem Bityutskiy wrote:
> On Mon, 2014-08-11 at 08:29 +0900, Akinobu Mita wrote:
> > nandsim can simulate NAND Flash which returns the ID bytes specified
> > by first_id_byte, ..., fourth_id_byte module parameters.
> > 
> > In order to simulate NAND flash which returns more than four ID bytes,
> > this adds id_bytes module parameter which is specified by the array of
> > byte like this:
> > 
> >  # modprobe nandsim id_bytes=0x98,0xdc,0x90,0x26,0x76,0x15,0x01,0x08 bch=1
> > 
> > This doesn't add fifth_id_byte, ..., seventh_id_byte module parameters,
> > becuase they are redundant.  But the existing first_id_byte, ...,
> > fourth_id_byte module parameters are preserved.
> 
> Hi, I missed this patch, sorry. It looks good to me, I'll take it to my
> tree.

Actually, let's merge this via the l2-mtd.git tree. Brian, what do you
think about this patch? It looks good for me in general, but I did not
review it line-by-line. The only thing is that the 'modinfo nandsim' may
look confusing for the user, who sees so many ID-related parameters, so
I'd add an "(obsolete)" marker to the string describing the old
parameters. But this is a minor thing, I did not want to ask Akinobu
about this because the patch was already waiting for very long time, I'd
do this myself while merging.

Artem.
