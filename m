Received: from popmail.space.net ([195.30.0.14])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18KFLb-000450-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 10:04:39 +0000
To: "Chantara Thlang" <thlang@iphase.com>
Cc: linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: need arguments to use JFFS2 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Fri, 06 Dec 2002 11:10:28 +0100."
             <049e01c29d0f$b3c52ff0$221faf9d@iphase.com>
Date: Fri, 06 Dec 2002 11:34:15 +0100
Message-Id: <20021206103420.76729C614B@atlas.denx.de>
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

Dear Chantara,

in message <049e01c29d0f$b3c52ff0$221faf9d@iphase.com> you wrote:
> 
> In the web, I am not sure to see an article which clearly express the
> advantage of JFFS2.

It makes little  sense  to  dicuss  "advantages"  without  specifying
requirements.

> Please could someone give me some arguments to use JFFS2 instead of all
> others Flash FS such as CRAMFS ?

One significant advantage is that JFFS2 provides a  _writable_  flash
filesystem,  while cramfs is read-only. But as stated before: this is
an advantage only when you need a writable filesystem.

> One of the reason could it be in the Flash management : optimization ?

Yes.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
Every program has at least one bug and can be shortened by  at  least
one instruction - from which, by induction, one can deduce that every
program can be reduced to one instruction which doesn't work.
