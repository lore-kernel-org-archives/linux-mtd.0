From: dwmw2@infradead.org (David Woodhouse)
Date: 05 Feb 2003 16:08:39 +0000
Subject: Changing subscription status
In-Reply-To: <1044457348.3011.2.camel@dirac.home>
References: <1044457348.3011.2.camel@dirac.home>
Message-ID: <1044461319.17701.6.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-05 at 15:02, Darren Freeman wrote:
> Dear list,
> 
> To me it's not at all obvious how to use the form:
> 
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> to change my email address subscription from free0076 at flinders.edu.au to
> dfreeman at ieee.org
> 
> I would have thought unsubscribing and resubscribing would be pretty
> easy, but the unsubscribe part has me baffled. Perhaps I got it right
> and the site was just timing out - but I give up.

The box was very unhappy and eating all of its swap space. Try again.

Enter 'free0076 at flinders.edu.au' into the box at the bottom and press
the 'Edit Options' button next to it. 

Enter your password in the box next to the 'Unsubscribe' button. Press
the button. If you need to click the 'Email my Password To Me' button
first, do so.

Go back to http://lists.infradead.org/mailman/listinfo/linux-mtd/ and
follow the link to the mxverify script at
http://lists.infradead.org/mxverify-cgi.html
as it says. Enter the address dfreeman at ieee.org and check it -- observe
that there's only one MX record, and decide not to use that address for
subscription. 

Choose another address. Repeat the mxverify procedure. Once you have an
address which is run sanely, go back to the mailman page and enter your
address into the 'Your _VERIFIED_ email address' box, enter your chosen
password twice, and hit the 'Subscribe' button. You'll receive a
confirmation email, to which you need to reply.


-- 
dwmw2
