From: dwmw2@infradead.org (David Woodhouse)
Date: 20 Feb 2003 16:32:32 +0000
Subject: Wacky JEDEC probes
In-Reply-To: <1045671999.2672.28.camel@tubarao>
References: <1045671999.2672.28.camel@tubarao>
Message-ID: <1045758752.27290.9.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-19 at 16:26, Thayne Harbaugh wrote:
> I have been experiencing wacky JEDEC probes which have the following
> symptoms:
> 
> - Devices ID at an aliased address where later on they won't respond
> 
> - Devices ID as the wrong device
> 
> - Devices respond with the wrong unlock addresses
> 
> I believe that most of the reason why this is happening is that the
> device has the ID's of another device stored as data.  Unlock address
> sequences vary slightly from device to device and if the wrong unlock
> addresses are used then the device really is not put into ID mode.  When
> addresses 0x0000 and 0x0001 are read then the _data_ is read and not the
> device ID's.  This means that the wrong device is detected and the wrong
> unlock addresses are stored for later use in erasing and writing. 
> Because the unlock addresses are wrong the erasing and writing fail.
> 
> The obvious problem is that there is no way to challenge a device and
> discover if it truly is in ID mode.  Because of this one must assume
> that sending the unlock sequence was correct and really worked.

Some devices don't _have_ an unlock sequence though. I'm more inclined
to follow the route of taking the chip _out_ of ident mode and checking
the contents change. Bear in mind that (IIRC) we should get the correct
ident from offset 0 and 1 in _every_ erase block, shouldn't we?

After finding an ident, we put the chip back in read mode and check for
the ident again. If it hasn't changed (i.e. the data matches the ident
we think we saw) then go back to ident mode and check for the ids in the
_next_ eraseblock instead. Or something like that ;)


> - Some devices have 8 bit and 16 bit modes and have unique unlock
> addresses for each.  I'm not sure which ones should be used - that's why
> these cases are labeled as "FIXME."

The one you use depends on the mode the chip is in -- you'd probably end
up wanting two separate entries for these chips, or depending on which
mode we're in.

> - It appears that some CFI devices are in the jedec_table[] - I'm not
> sure if this is desirable.

Possibly not. Who added them and when? (cvs annotate :)

> - The unlock_addrs[] array enumerates the known unlock addresses.  I
> have noticed that these address pairs can be x555/x2aa, x555/xaaa,
> x5555/x2aaa, x5555/xaaaa, x0/x0.  Some of these pairs are not currently
> listed because they are used for 8 bit mode on 16 bit devices.  Now that
> these addresses are enumerated it might be better to iterate over the
> list instead of keep state while shifting and or'ing.

That's a sane idea and entirely orthogonal to the original change, I
suppose.

-- 
dwmw2
