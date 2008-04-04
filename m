Date: Fri, 4 Apr 2008 13:10:27 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
In-Reply-To: <20080404093359.GA4338@logfs.org>
Message-ID: <Pine.LNX.4.64.0804041306470.10410@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-200585786-1207311027=:10410"
Cc: nico@cam.org, haokexin@gmail.com, dwmw2@infradead.org,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-200585786-1207311027=:10410
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

Hi Jörn

> 
> Ouch!  I've been bitten by these before.  After I've carefully written
> code that takes advantage of missing break; statements, a colleague of
> mine reordered the code and missed those subtleties.
> 
> Could you add a comment like this where appropriate:
> 		/* fall through */
No problem. See patch update in next message. 
> 
> It might even have prevented this bug if Kevin had seen such a comment
> before writing his patch.
> 
> Reviewed-By: Joern Engel <joern@logfs.org>
> 
> >  
> > -	case FL_SHUTDOWN:
> > -		/* The machine is rebooting now,so no one can get chip anymore */
> > -		return -EIO;
> >  	default:
> >  	sleep:
> >  		set_current_state(TASK_UNINTERRUPTIBLE);
> 
> 
---1831524198-200585786-1207311027=:10410--
