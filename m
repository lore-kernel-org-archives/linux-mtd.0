Received: from multi.imgtec.com ([194.200.65.239])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwpyR-0005by-G5
 for linux-mtd@lists.infradead.org; Wed, 10 Jul 2013 08:42:08 +0000
Message-ID: <51DD1E0F.80101@imgtec.com>
Date: Wed, 10 Jul 2013 09:40:47 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
To: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [RESEND][PATCH] mtd: refactor call to request_module
References: <20130708130512.GA24315@www.outflux.net>
 <87hag3cdp0.fsf@rustcorp.com.au>
In-Reply-To: <87hag3cdp0.fsf@rustcorp.com.au>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/07/13 04:10, Rusty Russell wrote:
> Kees Cook <keescook@chromium.org> writes:
>> This reduces the size of the stack frame when calling request_module().
>> Performing the sprintf before the call is not needed.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Acked-by: Rusty Russell <rusty@rustcorp.com.au>

I remember reviewing this before, so feel free to add my:

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
