Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaJnS-0000oF-Ib
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 04:16:57 +0000
Message-ID: <4EE6D1A4.9080005@newsguy.com>
Date: Mon, 12 Dec 2011 20:16:36 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala> <877h2590zp.fsf@free.fr>
 <1323724387.2297.13.camel@koala> <874nx5zbuj.fsf@free.fr>
In-Reply-To: <874nx5zbuj.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2011 02:03 PM, Robert Jarzmik wrote:
> Artem Bityutskiy <dedekind1@gmail.com> writes:
>
>> On Fri, 2011-12-09 at 17:13 +0100, Robert Jarzmik wrote:
>> What do you mean by "handle" ? Is the problem that docg3 maintains
>> per-eraseblock erase-counters and you do not know how to use them?
> Yes, exactly, docg3 maintains that counter for each block.
>
> I thought that upper layers (UBI,...) could use both the erase counter and the
> ECC number of flipped bits to select which block to erase next. After a quick
> glance, I don't think they can do it.


The erase counters are surely used by the TrueFFS library.  The diskonchip and
TrueFFS were both developed by M-Sys.  But since it's a unique feature of this
device, it would probably be impractical for ubi or mtd to use them.  I'm
impressed that you discovered them, though.  I had no clue that they existed on
the diskonchip P3.  They are probably on the G4 too.


>> May be it is better to just embrace this function with "#ifdef 0" and add a
>> comment that we can do this but do not have a good use for this?
> Ah yes, I didn't think about that possibility. It's looks better, I'll submit
> another patch with a comment and the #if 0.


Yeah, leave it in, commented out.  But don't submit a patch that produces a
compiler warning!

Thanks,
Mike
