Subject: Re: [PATCH] Fixes for several performance issues
From: David Woodhouse <dwmw2@infradead.org>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
In-Reply-To: <F92C2EFE7C3BA745855BF7036E1F3F9A01EF2E9D@NNSMSX401>
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01EF2E9D@NNSMSX401>
Content-Type: text/plain
Date: Wed, 14 Jun 2006 12:34:49 +0100
Message-Id: <1150284889.3176.80.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pitre <nico@cam.org>, Davide CASCONE <davide.cascone@st.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-14 at 15:12 +0400, Korolev, Alexey wrote:
> The current implementation has some performance and stability issues
> in CFI drivers. 

Thanks for the patch -- but it needs a Signed-off-by: and it needs to be
sent without getting mangled by your mailer.

History suggests that Intel's IT department are entirely incompetent and
are incapable of getting the mail program to behave correctly. I suggest
you use an external mail account. I can provide one for you if you're
going to help maintain the cfi_cmdset_0001 code.

You are unlikely to be able to reply, since Intel's mail system is so
broken that it doesn't even include References: headers in reply. Mail
me a SSH public key privately if you want an account on a non-broken
mail system.

cf. http://david.woodhou.se/email.html

You ought to have sent this patch to yourself _first_, and then verified
that it applies after you extract it from the email (which it won't).

-- 
dwmw2
