Date: Thu, 13 Jan 2005 19:23:00 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Brian Fox <bfox@netCelerant.com>
In-Reply-To: <BE0C07AC.5D8E%bfox@netCelerant.com>
Message-ID: <Pine.LNX.4.58.0501131918080.17331@phoenix.infradead.org>
References: <BE0C07AC.5D8E%bfox@netCelerant.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We might as well.
We even might to make it per file using fcntl.
(C) Josh W. Boyer: implement xattr support and use it for these purposes.

On Thu, 13 Jan 2005, Brian Fox wrote:
> On 1/13/05 10:55 AM, "Artem B. Bityuckiy" <dedekind@infradead.org> wrote:
> 
> > May be smth like:
> > #ifdef I_AM_NOT_PARANOID
> > static inline uint32_t
> > checksum(void *buf)
> > {
> > return 0;
> > } 
> 
> Well, David says a mount time option, which means it should be available all
> the time, and on a per mount basis.
> 
> So, why not have a checksum function jump table, per filesystem, and have
> all of the callers use that?
> 
> Thanks,
> 
> Brian
> -- 
> -------------------------------------------------------------------
> Brian J. Fox                                       netCelerant, Inc
> CTO                                             www.netCelerant.com
> bfox@netCelerant.com                             Ph: (805) 275-0214
> -------------------------------------------------------------------
> 
> 
> 
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
