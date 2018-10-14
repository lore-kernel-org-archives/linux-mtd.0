Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBana-0008LT-MZ
 for linux-mtd@lists.infradead.org; Sun, 14 Oct 2018 07:26:52 +0000
Date: Sun, 14 Oct 2018 09:26:38 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel
 Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala
 <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 09/14] mtd: maps: physmap: Fix coding style issues
 reported by checkpatch
Message-ID: <20181014092638.75cda7ad@bbrezillon>
In-Reply-To: <20181009095205.7d5cc9d9@bbrezillon>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-10-boris.brezillon@bootlin.com>
 <CAPybu_0XVLVrq+BvinjE2uF9u39La=N-b2-CZGf7q5vH89R4hg@mail.gmail.com>
 <20181009095205.7d5cc9d9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 9 Oct 2018 09:52:05 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> > > @@ -163,13 +164,16 @@ static int physmap_flash_probe(struct platform_device *dev)
> > >                 simple_map_init(&info->maps[i]);
> > >
> > >                 probe_type = rom_probe_types;
> > > -               if (physmap_data->probe_type == NULL) {
> > > -                       for (; info->mtds[i] == NULL && *probe_type != NULL; probe_type++)
> > > -                               info->mtds[i] = do_map_probe(*probe_type, &info->maps[i]);
> > > -               } else
> > > -                       info->mtds[i] = do_map_probe(physmap_data->probe_type, &info->maps[i]);
> > > +               if (!physmap_data->probe_type) {
> > > +                       for (; !info->mtds[i] && *probe_type; probe_type++)
> > > +                               info->mtds[i] = do_map_probe(*probe_type,
> > > +                                                            &info->maps[i]);
> > > +               } else {
> > > +                       info->mtds[i] = do_map_probe(physmap_data->probe_type,
> > > +                                                    &info->maps[i]);
> > > +               }    
> > 
> > Now that you are at it, maybe you want to change the order of the if branches:
> > 
> > if (true){
> > } else{
> > }
> > 
> > and move:
> > probe_type = rom_probe_types;
> > into the branch
> > 
> > and fix:
> > const char * const *probe_type;
> > 
> > 
> > If you do not want to change it, is also fine :P  
> 
> I don't mind changing that, but not in this patch :-).

Actually, I'll let you send a patch on top of my series if you still
want to address that ;-).
