Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBmFv-0004dB-Ek
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 13:45:56 +0000
Message-ID: <1377006661.2089.560.camel@sauron.fi.intel.com>
Subject: Re: temporary files on mtd file systems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Tue, 20 Aug 2013 16:51:01 +0300
In-Reply-To: <alpine.DEB.2.00.1308191539170.3183@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1308191539170.3183@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 15:55 +0200, Ricard Wanderlof wrote:
> Am I missing something here, or is there a "good" way to deal with this? 
> Of course there are several cleanup scenarios that could be imagened, such 
> as cleaning out all 'foo.*' files during boot for instance.
> 
> For applications that are not multi threaded, i.e. there may only be one 
> process updating foo, one way is to use the same temporary file name each 
> time, e.g. foo.temp. But things get awkward when using for instance glib, 
> which has a nice g_file_set_contents() call, complete with temporary file 
> handling and all, but which uses mkstemp as above to create the temporary 
> file, so there is no easy way of telling glib what filename to use, short 
> of rewriting a local function which indeed uses a constant temporary file 
> name.

Good question, the only thing which comes to my mind is that one could
try to use extended attributes or 'standard' (chattr(1)) attributes.

Something like having a special chattr which would indicate that the
file is up-to-date. When you need to update the file atomically, you
start with removing the attribute, syncing the file, then updating the
file, then syncing it, then creating the attribute, and probably syncing
too.

-- 
Best Regards,
Artem Bityutskiy
