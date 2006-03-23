Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMMll-0004cG-Ca
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 05:10:20 -0500
Message-ID: <4422740D.9080506@ru.mvista.com>
Date: Thu, 23 Mar 2006 13:10:21 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <npitre@mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
	<442111B5.6090308@yandex.ru> <442161C3.80604@intel.com>
	<1143038877.29683.10.camel@sauron.oktetlabs.ru>
	<442168D3.70302@intel.com>
	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
	<44216F99.9040304@intel.com> <44217124.20607@ru.mvista.com>
	<442179EB.9050605@intel.com> <4421A4BF.9060406@ru.mvista.com>
	<Pine.LNX.4.64.0603221428480.3631@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603221428480.3631@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:

>>Let's look at it at the following angle. Striping is a nice concept, as well
>>as many other nice concepts that exist in the world. Are they all worth being
>>impemented in Linux MTD subsystem? :)
>>    
>>
>
>Why not, if you can configure it out.
>  
>
Well, the thing is it's getting more and more complicated and harder to 
support...

>  
>
>>OTOH, what is the rationale? Make devices operate faster. Okay, why can't this
>>be implemented as mtdconcat optimization?
>>    
>>
>
>mtdconcat provides linear access to subdevices.
>
>The stripe module provides _interleaved_ access to subdevices.
>
>That is the fundamental difference.
>  
>
Let's make a config option to mtdconcat  switching between 
interleaved/linear access. Why not?

>  
>
>>What I'd also like to say is that having a lot of threads doesn't look
>>attractive to me.
>>    
>>
>
>What is the problem with threads?  The kernel already uses them heavily 
>for many purposes because it makes things cleaner.
>  
>
More threads = more overhead, more context switching, more possibilities 
to  decrease the system performance (wrong prio choice, prio inversion 
etc.).
Adding, say, 5 more threads (which doesn't look impossible wrt to this 
implementation) doesn't look good.

>  
>
>>I'd rather go in for changing the whole MTD subsystem to
>>make the API asynchoronus, and then you won't need many threads. But this is a
>>rather dramatic change...
>>    
>>
>
>But do you realize that any asynchronous implementation will _still_ 
>require kernel threads of its own to do the work anyway?  That's the 
>reason why there is so many kernel threads running in your kernel 
>already.
>  
>
Yes, but not necessarily so many of. I can even think of the following 
implementation (roughly):

- erase: issue a command to erase the block from 1st chip, issue command 
to erase the block from 2nd chip, wait on counting semaphore;
(this is happening in caller context)
- hrm, 2 callbacks on erase completion, increasing the semaphore counter 
(1 thread needed)

Vitaly
