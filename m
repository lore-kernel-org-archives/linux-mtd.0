Received: from [194.51.134.17] (helo=www.anfora.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16yXOU-00074m-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 13:21:38 +0100
Date: Fri, 19 Apr 2002 14:20:46 +0200
From: Gagneraud Christian <cgagneraud@anfora.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems when remounting jffs2
Message-Id: <20020419142046.7ced3de6.cgagneraud@anfora.fr>
In-Reply-To: <22791.1019217896@redhat.com>
References: <20020419135750.41135c46.cgagneraud@anfora.fr>
	<20020416163230.27f26996.cgagneraud@anfora.fr>
	<14742.1019213677@redhat.com>
	<22791.1019217896@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 19 Apr 2002 13:04:56 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> 
> OK,... so you commented out the code which sets the CRC, then without 
> mentioning this you asked on the mailing list why JFFS2 was complaining 
> that the CRC wasn't set correctly... :)
sorry, i'm relativly new in hacking in Linux. I'm not originaly a programmer
i'm hardwware engineer!
> 
> Put it back in again. Just:
> 	#define unlikely(x) (x)
OK, now i've add in include/linux/compiler.h:
#define likely(x)       __builtin_expect((x),1)
#define unlikely(x)     __builtin_expect((x),0)
so my compiler.h is the same as in 2.4.18
And now all works fine, that's great! i can mount,umount,mount,umount.......
thanks very much and all apologies.
> 
> --
> dwmw2
> 
> 

On Fri, 19 Apr 2002 11:54:37 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> 
> void jffs2_mark_erased_blocks(struct jffs2_sb_info *c)
> {
>         static struct jffs2_unknown_node marker = {
>                 magic:          JFFS2_MAGIC_BITMASK,
>                 nodetype:       JFFS2_NODETYPE_CLEANMARKER,
>                 totlen:         sizeof(struct jffs2_unknown_node)
>         };
>         struct jffs2_eraseblock *jeb;
>         struct jffs2_raw_node_ref *marker_ref = NULL;
>         unsigned char *ebuf;
>         size_t retlen;
>         int ret;
> 
>         if (unlikely(!marker.hdr_crc))
>                 marker.hdr_crc = crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4);
> 
> 
> Can you make that the calculated CRC when it calculates it?

My code is:

void jffs2_mark_erased_blocks(struct jffs2_sb_info *c)
{
        static struct jffs2_unknown_node marker = {
                magic:          JFFS2_MAGIC_BITMASK,
                nodetype:       JFFS2_NODETYPE_CLEANMARKER,
                totlen:         sizeof(struct jffs2_unknown_node)
        };
        struct jffs2_eraseblock *jeb;
        struct jffs2_raw_node_ref *marker_ref = NULL;
        unsigned char *ebuf;
        size_t retlen;
        int ret;
#if 0 /* GANS */
        if (unlikely(!marker.hdr_crc))
                marker.hdr_crc = crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4);
#endif

I have "#if 0" the if(unlikely) because i use kernel 2.4.4 and i dont have
the function unlikely (nor in my kernel, nor in mtd/jffs2), sorry but i'm a beginner.
So i have to remove my #if 0 and keep th unlikely from a recent kernel!
> 
> --
> dwmw2
> 
> 


-- 
/**********************************************
* Christian Gagneraud
***********************************************
* cgagneraud@anfora.fr
***********************************************
* ANFORA
* bat Actys, Voie3
* 31313 Labège Innopole
* FRANCE
***********************************************/

-- 
/**********************************************
* Christian Gagneraud
***********************************************
* cgagneraud@anfora.fr
***********************************************
* ANFORA
* bat Actys, Voie3
* 31313 Labège Innopole
* FRANCE
***********************************************/
