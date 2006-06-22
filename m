Received: from nf-out-0910.google.com ([64.233.182.190])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtNh0-0006bJ-NC
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 07:49:55 -0400
Received: by nf-out-0910.google.com with SMTP id p48so249381nfa
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jun 2006 04:49:46 -0700 (PDT)
Message-ID: <625fc13d0606220449p6c03674ehe40f58496c07c44b@mail.gmail.com>
Date: Thu, 22 Jun 2006 06:49:46 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: Current mtd tree is broken
In-Reply-To: <1150957222.4244.5.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
	<1150957222.4244.5.camel@sauron.oktetlabs.ru>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/22/06, Artem B. Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2006-06-21 at 17:35 -0500, Josh Boyer wrote:
> > 1) Remove the BUG call and allow writesize == 0 to be valid.  This is
> > what was originally done and I didn't see a problem with that.
>
> May panto just point which chips are broken? The fix must be trivial in
> most cases.

An overwhelmingly large amount of Intel command set chips.  As I said
before, only Intel Sibley and P30 chips get writesize set currently.
So anything older than that (which is 98% of the chips out there) are
broken.

Trivial or not, it needs to be done and verified for all the drivers.

josh
