Subject: Re: D. L. Moeller is not available.
From: David Woodhouse <dwmw2@infradead.org>
To: Dennis Moeller <moeller@us.ibm.com>
In-Reply-To: <OFBD618447.99DA310F-ON852571A7.00637C35-852571A7.00637C35@us.ibm.com>
References: <OFBD618447.99DA310F-ON852571A7.00637C35-852571A7.00637C35@us.ibm.com>
Content-Type: text/plain
Date: Mon, 10 Jul 2006 20:39:08 +0100
Message-Id: <1152560348.3373.120.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: postmaster@us.ibm.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-07-10 at 14:06 -0400, Dennis Moeller wrote:
> I will be out of the office starting  07/10/2006 and will not return until
> 07/24/2006.

Your autoresponder is broken in many ways -- so much so that it is a
denial of service attack waiting to happen.

It is responding to the wrong address. It should only ever reply to the
SMTP reverse-path of the mail which triggers it -- which in this case
would have gone to the automatic list management software instead of to
the list itself.

It is responding _from_ the wrong address. Autoresponses should have
'MAIL FROM:<>' in the SMTP transaction -- the 'null sender' as do
bounces. By sending responses with a non-empty reverse-path of their
own, you invite further bounces and automatic responses to your
autoresponse.... potentially leading to a mail loop.

You should also ensure that your autoreply does not respond to bulk
messages such as mailing lists to which you have subscribed.

Do not _ever_ subscribe this address again unless you have permanently
disabled this broken autoresponder, or unless your admin staff have
fixed its dangerous and abusive misbehaviour.

If you or anyone from IBM spams my list with such responses again, I
will consider that to be a deliberate attempt at a denial of service
attack.

I really don't expect this level of cluelessness from IBM.

-- 
dwmw2
