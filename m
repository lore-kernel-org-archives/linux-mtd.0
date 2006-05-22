From: David Woodhouse <dwmw2@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <1148302661.26156.8.camel@pim.off.vrfy.org>
References: <000c01c67d89$93035ae0$253682a4@nap.st.com>
	<1148299024.12285.26.camel@pmac.infradead.org>
	<1148299789.26156.3.camel@pim.off.vrfy.org>
	<1148302148.12285.40.camel@pmac.infradead.org>
	<1148302661.26156.8.camel@pim.off.vrfy.org>
Content-Type: text/plain
Date: Mon, 22 May 2006 14:16:58 +0100
Message-Id: <1148303818.12285.53.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Davide CASCONE <davide.cascone@st.com>
Subject: Re: latest patch download
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-22 at 14:57 +0200, Kay Sievers wrote:
> How can we determine the "not anything new" state? :)

git-diff origin.. | wc -l

Oh, wait... _its_ version of 'origin' will of course still be older.

But if I just configure gitweb with a _static_ list of 'parent trees' to
use for the 'not anything new' state, that's fine. If the tree in
question is a strict subset of _any_ of the listed 'parent trees', then
it's not interesting.

We can probably do even better than that -- we can look at what's in
remotes/origin and use that instead.

Actually, half those trees don't have remotes/origin at the moment --
but that's easily fixed. I have to create the list of repositories with
a script _anyway_, because it has to go looking in users' ~/public_git
directories. So I suppose I can make that script _ignore_ any repos
without it.

Actually, I'd like to group repos in the display according to their
parent. So all the repos based on mtd-2.6.git would be together, all the
repos based on mtd-utils.git would be together, and then the ones
without a matching parent would be in another group.

We could even put the intended parent into the index.aux file so that
gitweb doesn't have to work that out for itself.

> Does sorting it by age doesn't do what you are looking for?
>   http://git.infradead.org/?o=age

Hm, didn't know _that_ existed either. Is there documentation I haven't
been paying attention to?


-- 
dwmw2
