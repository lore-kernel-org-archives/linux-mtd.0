Message-ID: <1336465907.16236.14.camel@twins>
Subject: Re: [PATCH] UBI: Replace yield() with cond_resched()
From: Peter Zijlstra <peterz@infradead.org>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 08 May 2012 10:31:47 +0200
In-Reply-To: <1336465602-12627-1-git-send-email-richard@nod.at>
References: <1336465602-12627-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-05-08 at 10:26 +0200, Richard Weinberger wrote:
> The comment above yield()'s definition says:
>  * If you want to use yield() to wait for something, use wait_event().
>  * If you want to use yield() to be 'nice' for others, use cond_resched()=
.
>  * If you still want to use yield(), do not!

Oh wow, someone actually reads comments, sweet!!
