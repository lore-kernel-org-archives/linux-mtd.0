Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKvjY-0006AU-J9
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 17:33:17 +0000
Message-ID: <4EAEDBAC.6090505@newsguy.com>
Date: Mon, 31 Oct 2011 10:32:28 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 12/13] mtd/docg3: add ECC correction code
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>	<1319824292-11085-13-git-send-email-robert.jarzmik@free.fr>	<4EAE9FB6.6090200@newsguy.com>
	<87vcr586a0.fsf@free.fr>
In-Reply-To: <87vcr586a0.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/31/2011 09:39 AM, Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
>
>> Another explanatory comment here...
>>     /* undo last step in BCH alg (modulo mirroring not needed) */
> Is that the same as the function comment about bit reversing (the modulo
> mirroring part) ? If so, the function comment might not be clear enough. If not,
> could you explain a bit further please ?
>
>


No, the "modulo mirroring" is not the same as the bit reversal.  See Ivan's
explanation here:

http://lists.infradead.org/pipermail/linux-mtd/2011-October/038060.html

Obviously the comment doesn't give much technical detail, but it points anyone
puzzled by the step in the right direction.  I don't like cryptic steps that
give no explanation whatsoever.  Just MHO.

Thanks,
Mike
