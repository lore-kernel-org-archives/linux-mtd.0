Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUGEN-0002JJ-7I
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 11:47:56 +0000
Date: Tue, 15 May 2012 13:47:53 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] UBI: add lnum to struct ubi_work
In-Reply-To: <1337081204.2528.171.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1205151339020.18866@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205142046080.12448@eristoteles.iwoars.net>
 <1337080498.2528.161.camel@sauron.fi.intel.com>
 <1337081204.2528.171.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For vol_id, its straightforward everywhere except: ubi_wl_init_scan()

where scheduling erase on the:

struct ubi_scan_leb *seb

appears to lack access to the volume id.  Should we add vol_id to
ubi_scan_leb, and in ubi_scan() run:

        ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
                ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb)
			seb->vol_id = sv->vol_id;

Or is there a simpler way?

Cheers,
Joel Reardon

On Tue, 15 May 2012, Artem Bityutskiy wrote:

> On Tue, 2012-05-15 at 14:14 +0300, Artem Bityutskiy wrote:
> > On Mon, 2012-05-14 at 20:47 +0200, Joel Reardon wrote:
> > > @@ -1086,13 +1090,14 @@ out_ro:
> > >   * @ubi: UBI device description object
> > >   * @pnum: physical eraseblock to return
> > >   * @torture: if this physical eraseblock has to be tortured
> > > + * @lnum: the last used logical eraseblock number for the PEB
> > >   *
> > >   * This function is called to return physical eraseblock @pnum to the pool of
> > >   * free physical eraseblocks. The @torture flag has to be set if an I/O error
> > >   * occurred to this @pnum and it has to be tested. This function returns zero
> > >   * in case of success, and a negative error code in case of failure.
> > >   */
> > > -int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture)
> > > +int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture, int lnum)
> >
> > Joel, am sorry for nitpicking again, but could you please put the "lnum"
> > argument between "ubi" and "lnum" instead? Just feels more natural.
> > Otherwise the patch is OK. Thanks!
>
> Err, but you also need volume ID, because there may be several volumes
> with the same lnum.
>
> --
> Best Regards,
> Artem Bityutskiy
>
